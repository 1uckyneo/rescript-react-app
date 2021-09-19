

@val @scope(("window"))
external alert: (string) => unit = "alert"

@react.component
let make = (~addTask: (Task.task) => unit) => {
  let (text, setText) = React.useState(() => "")
  let (day, setDay) = React.useState(() => "")
  let (reminder, setReminder) = React.useState(() => false)


  let onSubmit = event => {
    ReactEvent.Form.preventDefault(event)

    switch text {
    | "" => alert("Please add a task")
    | _ => {
        let id = Belt.Int.toString(Js.Math.random_int(0, 1000000)) ++ text
    
    addTask({
      id: id,
      text,
      reminder,
      day
    })

    setText(_ => "")
    setDay(_ => "")
    setReminder(_ => false)
      }
    }

    
  }

  <form onSubmit className="add-form">
    <div className="form-control">
      <label>{React.string("Task")}</label>
      <input 
        type_="text" 
        name="text" 
        value={text}
        placeholder="Add Task" 
        onChange={event => {
          let value = ReactEvent.Form.target(event)["value"]
          setText(_ => value)
        }} 
       />
    </div>
    <div className="form-control">
      <label>{React.string("Day & Time")}</label>
      <input
        type_="text"
        name="day"
        value={day}
        placeholder="Add Day & Time"
        onChange={event => {
          let value = ReactEvent.Form.target(event)["value"]
          setDay(_ => value)
        }} 
      />
    </div>
    <div className="form-control form-control-check">
      <label>{React.string("Set Reminder")}</label>
      <input type_="checkbox" name="reminder" onChange={event => {
          let value = ReactEvent.Form.target(event)["checked"]
          setReminder(_ => value)
        }}
      />
    </div>
    <input type_="submit" value="Save Task" className="btn btn-block" />
  </form>
}