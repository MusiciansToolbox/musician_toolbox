function treeBuilder(jam_circle_id) {
  var ww = $(window).width(),
      wh = $(window).height(),
      sw = $('svg').width(),
      sh = $('svg').height(),
      radius = wh*.01,
      // i = 0,
      // duration = 750,
      root;


  $('svg').replaceWith('<svg></svg>')

  var svg = d3.select('body svg')

  var tree = d3.layout.tree()
    .size([sh,sw*.8]);

  var diagonal = d3.svg.diagonal()
    .projection(function(d){return [ d.y + sw*.1 , d.x ];});


  d3.json("/tree_data/" + jam_circle_id + ".json", function(data) {
    root = data

    var nodes = tree.nodes(root),
        links = tree.links(nodes);

    function drawLinks(){
      svg.selectAll("path")
        .data(links)
        .enter()
        .append("path")
        .attr("d", diagonal);
    }

    function setNodeLocations() {
      node = svg.selectAll('.node')
        .data(nodes)
        .enter()
        .append("g")
          .attr("class", "node")
          .attr("clip_id", function(d) { return d.id } )
          .attr("transform", function(d) { return "translate(" + (d.y + sw*.1)+ "," + d.x + ")";})
          .on("click", retrieveClip);
          // .on("click", click);
    }

    function drawCirclesAtNodeLocations() {
      node.append("circle")
        .attr("r", radius);
    };

    function addText() {
      node.append("text")
        .attr("transform", function(d) { return d.children || d._children ? "translate(-18.5,1.5)" : "translate(21.5,1.5)"})
        .attr("dy", ".35em")
        .attr("text-anchor", function(d) { return d.children || d._children ? "end" : "start"; })
        .text( function(d) {return d.name} )

      node.append("text")
        .attr("x", function(d) { return d.children || d._children ? -20 : 20; })
        .attr("dy", ".35em")
        .attr("fill", "white")
        .attr("text-anchor", function(d) { return d.children || d._children ? "end" : "start"; })
        .text( function(d) {return d.name} )

    }

    function drawEverthing() {
      drawLinks();
      setNodeLocations();
      drawCirclesAtNodeLocations();
      addText();
    }

    drawEverthing();

  })

  // function update(source) {
  //
  //   // Compute the new tree layout.
  //   var nodes = tree.nodes(root).reverse(),
  //       links = tree.links(nodes);
  //
  //   // Normalize for fixed-depth.
  //   // nodes.forEach(function(d) { d.y = d.depth * 400; });
  //
  //   // Update the nodes…
  //   var node = svg.selectAll("g.node")
  //       .data(nodes, function(d) { return d.id || (d.id = ++i); });
  //
  //   // Enter any new nodes at the parent's previous position.
  //   var nodeEnter = node.enter().append("g")
  //       .attr("class", "node")
  //       .attr("transform", function(d) { return "translate(" + source.y0 + "," + source.x0 + ")"; })
  //       // .on("click", click);
  //
  //   nodeEnter.append("circle")
  //       .attr("r", radius)
  //       .style("fill", function(d) { return d._children ? "black" : "#fff"; });
  //
  //   nodeEnter.append("text")
  //       .attr("x", function(d) { return d.children || d._children ? -10 : 10; })
  //       .attr("dy", ".35em")
  //       .attr("text-anchor", function(d) { return d.children || d._children ? "end" : "start"; })
  //       .text(function(d) { return d.name; })
  //       .style("fill-opacity", 1e-6);
  //
  //   // Transition nodes to their new position.
  //   var nodeUpdate = node.transition()
  //       .duration(duration)
  //       .attr("transform", function(d) { return "translate(" + d.y + "," + d.x + ")"; });
  //
  //   nodeUpdate.select("circle")
  //       .attr("r", radius)
  //       .style("fill", function(d) { return d._children ? "black" : "#fff"; });
  //
  //   nodeUpdate.select("text")
  //       .style("fill-opacity", 1);
  //
  //   // Transition exiting nodes to the parent's new position.
  //   var nodeExit = node.exit().transition()
  //       .duration(duration)
  //       .attr("transform", function(d) { return "translate(" + source.y + "," + source.x + ")"; })
  //       .remove();
  //
  //   nodeExit.select("circle")
  //       .attr("r", radius);
  //
  //   nodeExit.select("text")
  //       .style("fill-opacity", 1e-6);
  //
  //   // Update the links…
  //   var link = svg.selectAll("path.link")
  //       .data(links, function(d) { return d.target.id; });
  //
  //   // Enter any new links at the parent's previous position.
  //   link.enter().insert("path", "g")
  //       .attr("class", "link")
  //       .attr("d", function(d) {
  //         var o = {x: source.x0, y: source.y0};
  //         return diagonal({source: o, target: o});
  //       });
  //
  //   // Transition links to their new position.
  //   link.transition()
  //       .duration(duration)
  //       .attr("d", diagonal);
  //
  //   // Transition exiting nodes to the parent's new position.
  //   link.exit().transition()
  //       .duration(duration)
  //       .attr("d", function(d) {
  //         var o = {x: source.x, y: source.y};
  //         return diagonal({source: o, target: o});
  //       })
  //       .remove();
  //
  //   // Stash the old positions for transition.
  //   nodes.forEach(function(d) {
  //     d.x0 = d.x;
  //     d.y0 = d.y;
  //   });
  // }


  // // Toggle children on click.
  // function click(d) {
  //   if (d.children) {
  //     d._children = d.children;
  //     d.children = null;
  //   } else {
  //     d.children = d._children;
  //     d._children = null;
  //   }
  //   update(d);
  // }

  function retrieveClip(d) {
    var clip_id = d.clip_id;
    var clip_url = d.clip_url
    $('#myModal').modal('show');
    $('#play-button').attr('value', clip_id);
    $('#add-to-button').attr('value', clip_id);
    $('#download-button').attr('href', clip_url);
    $('#name').html("<a href='/users/" + d.user_id + "' target='_blank'>" + d.clip_user + "</a>");
    // $('#user-link').attr('href', "/users/" + d.user_id )
    // $('#name').html( d.clip_user );
    $('#instrument').html(d.clip_instrument);
  }
};
