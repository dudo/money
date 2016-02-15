class User extends React.Component {
  constructor (props) {
    super(props)
    this.state = {
      buckets: this.props.buckets,
      transactions: this.props.actual_flexible_spendings,
      income_info: this.props.income_info,
      fixed_cost_info: this.props.fixed_cost_info,
      financial_goal_info: this.props.financial_goal_info,
      flexible_spending_info: this.props.flexible_spending_info,
    }
  }

  static propTypes () {

  }

  componentDidMount() {
    drake = dragula(
      [document.querySelector('#income'),
       document.querySelector('#fixed_cost'),
       document.querySelector('#financial_goal'),
       document.querySelector('#flexible_spending')] );

    drake.on('drop', function(el, target, source, sibling) {
      switch (target.id) {
        case 'flexible_spending':
          switch (source.id) {
            case 'income':
            case 'fixed_cost':
            case 'financial_goal':
              return $.ajax({
                type: 'delete',
                dataType: 'javascript',
                url: '/buckets/' + $(el).attr("data-id")
              });
          }
          break;
        case 'income':
        case 'fixed_cost':
        case 'financial_goal':
          switch (source.id) {
            case 'flexible_spending':
              return $.ajax({
                type: 'post',
                dataType: 'javascript',
                url: '/buckets',
                data: {
                  bucket: {
                    original_category: $(el).data('category'),
                    name: $(el).data('name'),
                    amount: $(el).data('amount'),
                    type: target.id,
                    external_id: $(el).data('id'),
                    index: $(el).index()
                  }
                }
              });
            default:
              return $.ajax({
                type: 'put',
                dataType: 'javascript',
                url: '/buckets/' + $(el).data('id'),
                data: {
                  bucket: {
                    name: $(el).data('name'),
                    amount: $(el).data('amount'),
                    type: target.id,
                    index: $(el).index()
                  }
                }
              });
          }
          break;
      }
    });
  }

  render () {
    return (
      <div className='container user show'>
        <Bucket key={1}
                transactions={ this.state.buckets.where("( el, i ) => el.type == 'Income'") }
                type='Income'
                info={ this.state.income_info } />
        <Bucket key={2}
                transactions={ this.state.buckets.where("( el, i ) => el.type == 'FixedCost'") }
                type='FixedCost'
                info={ this.state.fixed_cost_info } />
        <Bucket key={3}
                transactions={ this.state.buckets.where("( el, i ) => el.type == 'FinancialGoal'") }
                type='FinancialGoal'
                info={ this.state.financial_goal_info } />
        <Bucket key={4}
                transactions={ this.state.transactions }
                type='FlexibleSpending'
                info={ this.state.flexible_spending_info } />
      </div>
    )
  }
}