function treeBuilderTest(jam_circle_id) {
  var ww = $(window).width(),
      wh = $(window).height(),
      sw = $('svg').width(),
      sh = $('svg').height(),
      radius = sh*.013,
      i = 0,
      duration = 750,
      root;


  $('svg').replaceWith('<svg></svg>')

  var svg = d3.select('body svg')

  var tree = d3.layout.tree()
    .size([sh,sw]);

  var diagonal = d3.svg.diagonal()
    .projection(function(d){return [ d.y , d.x ];});


  d3.json("/tree_data/" + jam_circle_id + ".json", function(data) {
    root = data
    // root.x0 = height / 2;
    // root.y0 = 0;
    //
    // function toggleAll(d) {
    //   if (d.children) {
    //     d.children.forEach(togglAll);
    //     toggle(d);
    //   }
    // }

    // // Initialize the display to show  few nodes.
    // root.children.forEach(toggleAll);
    // toggle(root.children[2])

    var nodes = tree.nodes(data),
        links = tree.links(nodes);

    function drawLinks(){
      svg.selectAll(".link")
      .data(links)
      .enter()
      .append("path")
      .attr("class", "link")
      .attr("fill", "none")
      .attr("stroke", "white")
      .attr("d", diagonal);
    }

    function setNodeLocations() {
      node = svg.selectAll('.node')
        .data(nodes)
        .enter()
        .append("g")
          .attr("class", "node")
          .attr("transform", function(d) { return "translate(" + d.y + "," + d.x + ")";})
          .on("click", click);
    }

    function drawCirclesAtNodeLocations() {
    node.append("circle")
      .attr("r", radius)
    };

    function addText() {
      node.append("text")
        .text(function(d) {return d.name;})
        .attr("transform", "translate(-20,5)")
        .attr("text-anchor", "end")
    }

    function drawEverthing() {
      drawLinks();
      setNodeLocations();
      drawCirclesAtNodeLocations();
      addText();
    }

    drawEverthing();

  })

  function update(source) {

    // Compute the new tree layout.
    var nodes = tree.nodes(root).reverse(),
        links = tree.links(nodes);

    // Normalize for fixed-depth.
    // nodes.forEach(function(d) { d.y = d.depth * 400; });

    // Update the nodes…
    var node = svg.selectAll("g.node")
        .data(nodes, function(d) { return d.id || (d.id = ++i); });

    // Enter any new nodes at the parent's previous position.
    var nodeEnter = node.enter().append("g")
        .attr("class", "node")
        .attr("transform", function(d) { return "translate(" + source.y0 + "," + source.x0 + ")"; })
        .on("click", click);

    nodeEnter.append("circle")
        .attr("r", radius)
        .style("fill", function(d) { return d._children ? "black" : "#fff"; });

    nodeEnter.append("text")
        .attr("x", function(d) { return d.children || d._children ? -10 : 10; })
        .attr("dy", ".35em")
        .attr("text-anchor", function(d) { return d.children || d._children ? "end" : "start"; })
        .text(function(d) { return d.name; })
        .style("fill-opacity", 1e-6);

    // Transition nodes to their new position.
    var nodeUpdate = node.transition()
        .duration(duration)
        .attr("transform", function(d) { return "translate(" + d.y + "," + d.x + ")"; });

    nodeUpdate.select("circle")
        .attr("r", radius)
        .style("fill", function(d) { return d._children ? "black" : "#fff"; });

    nodeUpdate.select("text")
        .style("fill-opacity", 1);

    // Transition exiting nodes to the parent's new position.
    var nodeExit = node.exit().transition()
        .duration(duration)
        .attr("transform", function(d) { return "translate(" + source.y + "," + source.x + ")"; })
        .remove();

    nodeExit.select("circle")
        .attr("r", radius);

    nodeExit.select("text")
        .style("fill-opacity", 1e-6);

    // Update the links…
    var link = svg.selectAll("path.link")
        .data(links, function(d) { return d.target.id; });

    // Enter any new links at the parent's previous position.
    link.enter().insert("path", "g")
        .attr("class", "link")
        .attr("d", function(d) {
          var o = {x: source.x0, y: source.y0};
          return diagonal({source: o, target: o});
        });

    // Transition links to their new position.
    link.transition()
        .duration(duration)
        .attr("d", diagonal);

    // Transition exiting nodes to the parent's new position.
    link.exit().transition()
        .duration(duration)
        .attr("d", function(d) {
          var o = {x: source.x, y: source.y};
          return diagonal({source: o, target: o});
        })
        .remove();

    // Stash the old positions for transition.
    nodes.forEach(function(d) {
      d.x0 = d.x;
      d.y0 = d.y;
    });
  }


  // Toggle children on click.
  function click(d) {
    if (d.children) {
      d._children = d.children;
      d.children = null;
    } else {
      d.children = d._children;
      d._children = null;
    }
    update(d);
  }

};
