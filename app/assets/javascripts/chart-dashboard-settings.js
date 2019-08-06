
/*
Colors
*/
var chartColors = {
    dark_orange: '#f69259e6',
    light_orange: '#ffdb6fe6',
    purple: '#8176b5e6',
    purple_blue: '#76c4e2e6',
    green: '#92fe9de6',
    green_blue: '#00c9ffe6',
    green_blue_solid: '#00c9ff',
    red: '#fc6076e6',
    red_orange: '#ff9a44e6',
    red_orange_solid: '#ff9a44',
    light : {
        text : '#DCDCDC',
        gridlines : '#808080',
        pie_borders: '#424242'
    },
    dark : {
        text_black : '#1b2126',
        text : '#626567',
        gridlines : '#E5E7E9',
        pie_borders: '#fff'
    },
    transparent : '#00000000',
    transparent_white : '#FFFFFF22'
};



// function getData () {
//     profile_completion = "<%= current_user.profile_completion %>";
//
//     return profile_completion;
//
// }


function buildCharts() {
    // getData();

    var ctx_dc0 = document.getElementById('profileCompletionPie').getContext('2d');
    var completion_dc0 = ctx_dc0.createLinearGradient(150.000, 0.000, 150.000, 300.000);
    completion_dc0.addColorStop(0.000, chartColors.green_blue);
    completion_dc0.addColorStop(1.000, chartColors.red_orange);
    var profileCompletion_Doughnut = new Chart(ctx_dc0, {
        type: 'doughnut',
        data: {
            datasets: [{
                data: [
                    profile_completion,
                    100-profile_completion
                ],
                backgroundColor: [
                    completion_dc0,
                ],
                borderColor: [
                    chartColors.transparent,
                    chartColors.transparent
                ],
                hoverBackgroundColor: [
                    completion_dc0,
                ],
                hoverBorderColor: [
                    chartColors.transparent_white,
                    chartColors.transparent_white
                ],
            }],
            labels: [
                'Completion'
            ]
        },
        options: {
            responsive: true,
            legend: {
                display: true,
                position: 'bottom'
            },
            title: {
                display: true,
                text: 'Completion'
            },
            animation: {
                animateScale: true,
                animateRotate: true
            },
            aspectRatio: 1,

        }
    });

}

buildCharts();