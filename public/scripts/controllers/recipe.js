doRemove = function(id){
    if(confirm('Deseja remover esta receita?')){
        doPost('/recipe/remove', {id: id});        
    }
};