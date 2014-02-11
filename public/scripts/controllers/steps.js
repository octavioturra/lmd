angular.module('lmd').controller('StepsCtrl', function ($scope) {
    var Step = function () {
        function Step() {};

        var self = Step.prototype;
        self.description = '';
        self.order = 1;
        self.optional = false;
        return Step;
    }();

    $scope.step = new Step;
    $scope.add = function () {
        var step = $scope.step;
        if (step.order < 1) {

            return;
        }
        if (step.description === '') {

            return;
        }
        $scope.recipe.steps.push(step);
        $scope.step = new Step;
    }
    $scope.remove = function (step) {
        $scope.recipe.steps = _.without($scope.recipe.steps, step);
    }
});