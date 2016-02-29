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
        { this.renderFrequencyInput() }
        { this.renderFluctuationInput() }
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

  renderFluctuationInput() {
    return (
      <input
        type='number'
        step="any"
        id='fluctuation'
        ref='fluctuation'
        defaultValue={ this.state.fluctuation }
        placeholder={ 'Fluctuation +/- ' + this.props.calculated_fluctuation } />
    )
  }

  renderFrequencyInput() {
    return (
      <input
        type='number'
        step="any"
        id='frequency'
        ref='frequency'
        defaultValue={ this.state.frequency }
        placeholder={ 'Frequency x ' + this.props.calculated_frequency } />
    )
  }

}


// <div style="position:relative;" class="blurred ">
//   <label for="username">Personal ID</label>
//   <input aria-required="true" autocapitalize="off" autocomplete="off" autocorrect="off" id="username" name="username" placeholder="Personal ID" spellcheck="off" type="text">
// </div>

// .a-form .blurred label, .a-form .focused label {
//     opacity: 1;
//     top: 13px;
//     -webkit-transition: all .2s;
//     -moz-transition: all .2s;
//     -ms-transition: all .2s;
//     -o-transition: all .2s;
//     transition: all .2s;
// }

// .a-form label {
//     position: absolute;
//     top: 3px;
//     color: #c1c1c1;
//     right: 9px;
//     font-size: 11px;
//     opacity: 0;
// }

// .a-form label, h1, h2, h3, h4, h5, span {
//     text-shadow: rgba(0,0,0,.01) 0 0 1px;
// }

// input[type=text], input[type=number], input[type=password] {
//     box-sizing: border-box;
//     margin: 6px 0;
//     width: 100%;
//     height: 48px;
//     border-radius: 4px;
//     border: 1px solid #ccc;
//     padding: 0 12px;
//     color: #929292;
//     background-color: #f8f8f8;
//     box-shadow: inset 0 0 1px 1px #fff,0 1px 4px rgba(191,191,191,.04);
//     font: 18px/1.4 Goth,sans-serif;
//     -webkit-font-smoothing: antialiased;
// }