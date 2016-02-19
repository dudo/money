class Transaction extends React.Component {

  static propTypes () {
    name: React.PropTypes.string
  }

  constructor (props) {
    super(props)
    this.state = {
      flex: this.props.flex
    }
  }

  render () {
    areaClass = ['progress-bar-indication']
    form = !this.state.flex ? <TransactionForm {...this.props} /> : ""
    return (
      <li className={ areaClass.join(' ') }
          title={ this.props.name }
          data-name={ this.props.original_name }
          data-amount={ this.props.amount }
          data-category={ this.props.original_category }
          data-id={ this.props.external_id } >
        <div className='main group'>
          <span className='meter' style={ {width: this.props.percent_complete + "%"} } />
          <p className='name left'>{ this.props.name.truncate(20) }</p>
          <p className='amount right'>{ parseFloat(this.props.amount).formatMoney() }</p>
        </div>
        { form }
      </li>
    )
  }
}