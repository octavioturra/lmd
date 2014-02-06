var random = function(){
    return ((Math.random()*3333)%100).toFixed(2);
}

var doPost = function(url, query){
    var form = document.createElement('form');
    form.method = 'post';
    
    var content = '';
    
    var queryString = '?_r=' + random() + '&'
    
    if(_.isObject(query)){
        _.each(_.pairs(query), function(i){
            content += '<input type="hidden" name="' + i[0]  + '" value="' + i[1] + '">';
        });
    }else{
        queryString += $.param(query)
    }
    
    form.action = url + queryString;
    form.innerHTML = content;
    
    form.submit();
}