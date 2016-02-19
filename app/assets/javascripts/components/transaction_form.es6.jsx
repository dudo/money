class TransactionForm extends React.Component {

  constructor (props) {
    super(props)
    this.state = {
      name: this.props.name,
      amount: this.props.amount,
      frequency: this.props.frequency,
      fluctuation: this.props.fluctuation,
      errors: {}
    }
  }

  // handleChange (event) {
  //   this.setState({
  //     name: this.refs.name.value,
  //     amount: this.refs.amount.value,
  //     frequency: this.refs.frequency.value,
  //     fluctuation: this.refs.fluctuation.value
  //   })
  // }

  render () {
    return (
      <form
        onSubmit={this.handleSubmit} >
        { this.renderInput('name', 'Name', 'text', this.state.name) }
        { this.renderInput('amount', 'Amount', 'number', this.state.amount) }
        { this.renderInput('frequency', 'Frequency', 'number', this.state.frequency) }
        { this.renderInput('fluctuation', 'Fluctuation', 'number', this.state.fluctuation) }
        <input type="submit" value="Submit" />
      </form>
    )
  }

  getFormData () {
    return {
      name: this.refs.name.getDOMNode().value,
      amount: this.refs.amount.getDOMNode().value,
      frequency: this.refs.frequency.getDOMNode().value,
      fluctuation: this.refs.fluctuation.getDOMNode().value
    }
  }

  renderInput (id, label, type, value) {
    return (
      <input
        type={ type }
        step="any"
        id={ id }
        ref={ id }
        defaultValue={ value }
        placeholder={ label } />
    )
  }


}
