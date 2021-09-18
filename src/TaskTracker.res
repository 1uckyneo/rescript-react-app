@react.component
let make = () => {
  open Belt

  let (todos, setTodos) = React.useState(() => Task.defaultTasks)

  let addTask = task => setTodos(prevTodos => prevTodos->Array.concat([task]))

  let deleteTask = id => setTodos(prevTodos => prevTodos->Js.Array2.filter(task => task.id !== id))

  let toggleReminder = id =>
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
      <h1> {React.string("Task Tracker")} </h1>
      <Button _type={Add}> {React.string("Add Task")} </Button>
    </header>
    <ul> {React.array(todos->Js.Array2.map(task => <Task task toggleReminder deleteTask />))} </ul>
  </div>
}
