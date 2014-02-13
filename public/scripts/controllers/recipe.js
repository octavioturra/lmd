doRemove = function (id) {
    if (confirm('Deseja remover esta receita?')) {
        doPost('/recipe/remove', {
            id: id
        });
    }
};

angular.module('lmd').controller('RecipeCtrl', function ($scope, $http) {
    var recipe = {
        id: '',
        ingredients: [],
        steps: [],
        author: {}
    };
    $scope.recipe = recipe;

    $scope.loadRecipe = function (id) {
        $http({
            method: 'GET',
            url: '/recipe/data/' + id
        }).success(function(d) {
            if(!d){
                return;
            }
            if(!d.success){
                return;    
            }
            $scope.recipe = d.data;
            recipe = $scope.recipe;
        }).error(function (d) {

        }); 
    };

    $scope.save = function () {
        $http({
            method: 'POST',
            url: '/recipe/' + recipe.id,
            headers: {
                'Content-type': 'application/json'
            },
            data: recipe
        })
            .success(function (d) {
                console.log(d);
            })
            .error(function (d) {
                console.log(d);
            })
    };
});