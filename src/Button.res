@react.component
let make = (~children: React.element, ~color, ~onClick=?) => {
  let style = ReactDOM.Style.make(~backgroundColor=color, ())

  let onClick = _ => {
    switch onClick {
    | Some(onClick) => onClick()
    | None => ()
    }
  }

  <button className="btn" style onClick> children </button>
}
