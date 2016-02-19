class Bucket extends React.Component {

  constructor (props) {
    super(props)
    this.state = {
      transactions: this.props.transactions
    }
  }

  static propTypes () {
    name: React.PropTypes.string
  }

  render () {
    flex = this.props.type == 'FlexibleSpending'
    areaClass = []
    if (!flex) {
      areaClass.push('bucket')
    } else {
      areaClass.push('transaction')
    }
    id = humps.decamelize(this.props.type)
    amount_left = flex ? (this.props.info.monthly - this.props.info.actual).formatMoney() : ""
    return (
      <div className='span3'>
        <h2>{ id.titleize() }<span className='right'>{ amount_left }</span></h2>
        <h3>
          { this.props.info.actual.formatMoney() } / { this.props.info.monthly.formatMoney() }
        </h3>
        <ul id={ id } className={ areaClass.join(' ') }>
          { this.state.transactions.map( (transaction, i) =>
            <Transaction key={ transaction.external_id }
                         flex={ flex }
                         { ...transaction } />
          ) }
        </ul>
      </div>
    )
  }
}

