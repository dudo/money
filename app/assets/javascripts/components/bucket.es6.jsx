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
    // { if (flex) { (this.props.info.monthly - this.props.info.actual).formatMoney() } }
    return (
      <div className='span3'>
        <h2>{ id.titleize() }</h2>
        <h3>
          { this.props.info.actual.formatMoney() } / { this.props.info.monthly.formatMoney() }

        </h3>
        <ul id={ id } className={ areaClass.join(' ') }>
          { this.state.transactions.map( (transaction, i) =>
            <Transaction key={ transaction.external_id }
                         { ...transaction } />
          ) }
        </ul>
      </div>
    )
  }
}

