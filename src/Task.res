type task = {
  id: string,
  text: string,
  day: string,
  reminder: bool,
}

let defaultTasks: array<task> = [
  {
    id: "1",
    text: "Doctors Appointment",
    day: "September 1st at 2:30pm",
    reminder: true,
  },
  {
    id: "2",
    text: "Meeting at Scholl",
    day: "September 3st at 1:30pm",
    reminder: false,
  },
  {
    id: "3",
    text: "September 3st at 11:00am",
    day: "",
    reminder: true,
  },
]

@react.component
let make = (~task, ~toggleReminder, ~deleteTask) => {
  let className = if task.reminder {
    "task reminder"
  } else {
    "task"
  }

  let onDoubleClick = _ => {
    toggleReminder(task.id)
  }

  let onClick = _ => {
    deleteTask(task.id)
  }

  <div key={task.id} onDoubleClick>
    <div className>
      <h3>
        {React.string(task.text)} <span className="fas" onClick> {React.string("x")} </span>
      </h3>
      <p> {React.string(task.day)} </p>
    </div>
  </div>
}
