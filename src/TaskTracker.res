@react.component
let make = () => {
  open Belt

  let (showAddTask, setShowAddTask) = React.useState(() => false)

  let toogleShowAddTask = () => setShowAddTask(prev => !prev)

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

  <div>
    <Header title={"Task Tracker"} toogleShowAddTask showAddTask />
    {if showAddTask {
      <AddTask addTask />
    } else {
      React.null
    }}
    <div>
      {React.array(
        todos->Js.Array2.map(task => <Task key={task.id} task toggleReminder deleteTask />),
      )}
    </div>
  </div>
}
