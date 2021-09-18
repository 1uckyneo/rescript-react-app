@react.component
let make = () => {
  open Belt

  let (todos, setTodos) = React.useState(() => Task.defaultTasks)

  let add = task => setTodos(prevTodos => prevTodos->Array.concat([task]))

  let delete = id => setTodos(prevTodos => prevTodos->Js.Array2.filter(task => task.id !== id))

  let togglereminder = id =>
    setTodos(prevTodos =>
      prevTodos->Js.Array2.map(task => {
        if task.id === id {
          {
            ...task,
            reminder: !task.reminder,
          }
        } else {
          task
        }
      })
    )

  <div className="todolist">
    <header className="header">
      <h1> {React.string("TodoList")} </h1>
      <Button _type={Add}> {React.string("Add Task")} </Button>
    </header>
    <ul> {React.array(todos->Js.Array2.map(task => <Task task={task} />))} </ul>
  </div>
}
