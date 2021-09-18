type task = {
  id: string,
  text: string,
  day: string,
  reminder: bool,
}

let defaultTasks: array<task> = [
  {
    id: "a",
    text: "a",
    day: "a day",
    reminder: true,
  },
  {
    id: "a",
    text: "a",
    day: "a day",
    reminder: true,
  },
]

@react.component
let make = (~task: task) => {
  <div key={task.id}>
    <div className="reminder">
      <h3> {React.string(task.text)} <i className="fas fa-times" /> </h3>
      <p> {React.string(task.day)} </p>
    </div>
  </div>
}
