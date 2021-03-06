
/* functions that deal with requests to the server */

var TaskPersist = {
  put: function(task) {
    $.ajax({url: "/task",
            method: "POST",
            data: task })
  },
  fetch: function(cb) {
    $.ajax({url: "/task",
            method: "GET"}).done(cb)
  },
  delete: function(id) {
    $.ajax({url: "/task/"+id,
            method: "DELETE"})
  }
}

/* functions that store/retrieve tasks to a client side store */
var TaskStore = {
  _data: {},
  add: function(task) {
    this._data[task.id] = task;
  },
  addMany: function(tasks) {
    $.each(tasks, function(i, task) {
      this.add(task);
    }.bind(this));
  },
  delete: function(id) {
    delete this._data[id];
  },
  all: function() {
    var a = []
    for(var id in this._data) {
      a.push(this._data[id])
    }
    return a;
  }
}

var AppView = {
  taskTemplate: function(task) {
    return $("<li class='task' id='"+task.id+"'>"+task.description+"</li>");
  },
  render: function () {
    $("#tasks").html("")
    $.each(TaskStore.all(), function(i, task){
      AppView.taskTemplate(task).appendTo("#tasks");
    })
  }
}

$("form").on("submit", function(e) {
  e.preventDefault();
  var task = {id: Date.now(), description: $("#new-task").val()}

  TaskStore.add(task);
  AppView.render();
  TaskPersist.put(task);

  $("#new-task").val("")
});

$("#tasks").on("click", ".task", function(e) {
  var id = $(e.target).attr("id");
  TaskStore.delete(id);
  TaskPersist.delete(id);

  AppView.render();
})

TaskPersist.fetch(function(tasks) {
  TaskStore.addMany(tasks);
  AppView.render();
})
