
@PlaceSection = React.createClass
  # Display name used for debugging
  displayName: 'PlaceSection'

  # Invoked before the component is mounted and provides the initial 
  # state for the render method.
  getInitialState: ->
    # We'll change it to true once we fetch data
    didFetchData: false
    # The people JSON array used to display the cards in the view
    people: []
