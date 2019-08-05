




// function getData () {
//     profile_completion = "<%= current_user.profile_completion %>";
//
//     return profile_completion;
//
// }


function buildCharts() {
    // getData();
    console.log( profile_completion);

    var ctx_dc0 = document.getElementById('profileCompletionPie').getContext('2d');

    var profileCompletion_Doughnut = new Chart(ctx_dc0, {
        type: 'doughnut',
        data: {
            datasets: [{
                data: [
                    profile_completion,
                    100-profile_completion
                ]
            }
            ],
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
            elements: {
                arc: {
                }
            }
        }
    });

}

buildCharts();