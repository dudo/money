function lambda(l) {
   var fn = l.match(/\((.*)\)\s*=>\s*(.*)/) ;
   var p = [] ;
   var b = "" ;

   if ( fn.length > 0 ) fn.shift() ;
   if ( fn.length > 0 ) b = fn.pop() ;
   if ( fn.length > 0 ) p = fn.pop().replace(/^\s*|\s(?=\s)|\s*$|,/g, '').split(' ') ;

   // prepend a return if not already there.
   fn = ( ( ! /\s*return\s+/.test( b ) ) ? "return " : "" ) + b ;

   p.push( fn ) ;

   try { return Function.apply( {}, p ) ; }
   catch(e) { return null ; }
}

Array.prototype.where = function(f) {
   var fn = f ;
   // if type of parameter is string
   if ( typeof f == "string" )
      // try to make it into a function
      if ( ( fn = lambda( fn ) ) == null )
         // if fail, throw exception
         throw "Syntax error in lambda string: " + f ;
   // initialize result array
   var res = [] ;
   var l = this.length;
   // set up parameters for filter function call
   var p = [ 0, 0, res ] ;
   // append any pass-through parameters to parameter array
   for (var i = 1; i < arguments.length; i++) p.push( arguments[i] );
   // for each array element, pass to filter function
   for (var i = 0; i < l ; i++)
   {
      // skip missing elements
      if ( typeof this[ i ] == "undefined" ) continue ;
      // param1 = array element
      p[ 0 ] = this[ i ] ;
      // param2 = current indeex
      p[ 1 ] = i ;
      // call filter function. if return true, copy element to results
      if ( !! fn.apply(this, p)  ) res.push(this[i]);
   }
   // return filtered result
   return res ;
}

String.prototype.capitalize = function() {
   return this.charAt(0).toUpperCase() + this.slice(1) ;
}

String.prototype.titleize = function() {
   var string_array = this.split(/[\s-_]+/) ;
   var articles = "a an the".split(' ') ;
   var conjunctions = "and but or nor".split(' ') ;
   var prepositions = "at by for from in into of off on onto out over up with".split(' ') ;
   var infinitives = "to".split(' ') ;
   var ignored = articles.concat(conjunctions).concat(prepositions).concat(infinitives) ;
   string_array = string_array.map(function(str, i) {
      if (i != 0 && ignored.includes(str)) { return } ;
      return str.capitalize() ;
   }) ;

   return string_array.join(' ') ;
}

String.prototype.truncate = function(length) {
   if (this.length > length) {
      return this.substring(0, length - 3) + "..." ;
   } else {
      return this ;
   };
}

Number.prototype.formatMoney = function(c, d, t) {
   var n = this,
   c = isNaN(c = Math.abs(c)) ? 2 : c,
   d = d == undefined ? "." : d,
   t = t == undefined ? "," : t,
   s = n < 0 ? "-" : "",
   i = parseInt(n = Math.abs(+n || 0).toFixed(c)) + "",
   j = (j = i.length) > 3 ? j % 3 : 0;
   return '$' + s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "");
 }