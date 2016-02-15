class Transaction extends React.Component {

  static propTypes () {
    name: React.PropTypes.string
  }

  expand_form () {
    $(".header").click(function () {

      $header = $(this);
      //getting the next element
      $content = $header.next();
      //open up the content needed - toggle the slide- if visible, slide up, if not slidedown.
      $content.slideToggle(500, function () {
        //execute this after slideToggle is done
        //change text of header based on visibility of content div
        $header.text(function () {
          //change text based on condition
          return $content.is(":visible") ? "Collapse" : "Expand";
        });
      });
    });
  }

  render () {
    if (this.props.type != 'FlexibleSpending') {

    }
    var areaClass = ['progress-bar-indication']
    return (
      <li className={ areaClass.join(' ') }
          title={ this.props.name }
          data-name={ this.props.original_name }
          data-amount={ this.props.amount }
          data-category={ this.props.original_category }
          data-id={ this.props.external_id }
          onClick={ this.expand_form } >
        <span className='meter' style={ {width: this.props.percent_complete + "%"} } />
        <p className='left'>{ this.props.name.truncate(20) }</p>
        <p className='right'>{ parseFloat(this.props.amount).formatMoney() }</p>
      </li>
    )
  }
}