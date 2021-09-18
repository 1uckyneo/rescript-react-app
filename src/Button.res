type btnType =
  | Add
  | Delete

@react.component
let make = (~children: React.element, ~_type: btnType) => {
  let style = switch _type {
  | Add => ReactDOM.Style.make(~backgroundColor="green", ())
  | Delete => ReactDOM.Style.make(~backgroundColor="red", ())
  }

  <button className="btn" style> children </button>
}
