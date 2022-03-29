import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["ratingsChart"]


  connect() {
    const ctx = this.ratingsChartTarget.getContext('2d');
    const ratingsChart = new Chart(ctx, {
      type: 'bar',
      data: {
        labels: JSON.parse(ctx.canvas.dataset.ratingsLabels),
        datasets: [{
          label: 'Ratings',
          data: JSON.parse(ctx.canvas.dataset.ratings),

          backgroundColor: [
            'rgba(255, 51, 58, 0.75)',
            'rgba(255, 163, 62, 0.75)',
            'rgba(255, 220, 72, 0.75)',
            'rgba(0, 192, 115, 0.75)',
            'rgba(0, 143, 136, 0.75)',
            'rgba(255, 159, 64, 0.75)'
          ],
          borderColor: [
            'rgba(255, 51, 58, 1)',
            'rgba(255, 163, 62, 1)',
            'rgba(255, 220, 72, 1)',
            'rgba(0, 192, 115, 1)',
            'rgba(0, 143, 136, 1)',
            'rgba(255, 159, 64, 1)'
          ],
          borderWidth: 1
        }]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        legend: {
          display: true,
          labels: {
            fontColor: "#000080",
          }
        },
        plugins: {
          autocolors: false,
          annotation: {
            annotations: {
              line1: {
                type: 'line',
                scaleID: 'x',
                value: this.data.get("mean") - 1,
                borderColor: 'rgb(255, 99, 132)',
                borderWidth: 2,
                label: {
                  content: "Mean",
                  enabled: true,
                  position: "top"
                }
              },
              line2: {
                type: 'line',
                scaleID: 'x',
                value: this.data.get("median") - 1,
                borderColor: 'rgb(0, 99, 132)',
                borderWidth: 2,
                label: {
                  content: "Median",
                  enabled: true,
                  position: "top"
                }
              }
            }
          }
        }
      }
    });
  }
}