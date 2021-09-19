@react.component
let make = (~showAddTask, ~toogleShowAddTask, ~title) => {
  let (color, text) = if !showAddTask {
    ("green", "Add Task")
  } else {
    ("red", "Close")
  }

  <div className="header">
    <h1> {React.string(title)} </h1>
    <Button color onClick={toogleShowAddTask}> {React.string(text)} </Button>
  </div>
}
