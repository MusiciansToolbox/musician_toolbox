function treeBuilderTest(jam_circle_id) {
  var ww = $(window).width(),
      wh = $(window).height(),
      sw = $('svg').width(),
      sh = $('svg').height(),
      radius = sh*.01

  $('svg').replaceWith('<svg></svg>')

  var svg = d3.select('body svg')

  var tree = d3.layout.tree()
    .size([sh,sw]);

  var diagonal = d3.svg.diagonal()
    .projection(function(d){return [ d.y , d.x ];});


  d3.json("/tree_data/" + jam_circle_id + ".json", function(data) {
    // root = data
    // root.x0 = height / 2;
    // root.y0 = 0;

    // function toggleAll(d) {
    //   if (d.children) {
    //     d.children.forEach(togglAll);
    //     toggle(d);
    //   }
    // }

    // Initialize the display to show  few nodes.
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
          // .on("click", click);
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
