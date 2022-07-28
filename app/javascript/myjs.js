
if (window.location.pathname.includes('/results/')) {
  
  window.addEventListener("load", () =>  {  
    const pb = document.querySelector('.progress-bar');
    const current_qst_num = Number(document.querySelector('.card').dataset.currentQstNumber).toFixed(2);
    const qst_count = Number(document.querySelector('.card').dataset.qstCount).toFixed(2);
    const progress_value = current_qst_num/qst_count*100;

    pb.style.width = pb.innerText = `${progress_value.toFixed(2)}%`;
  })

  document.addEventListener("DOMContentLoaded", () => {
  
    const format_value = (value) => value.toLocaleString( undefined, { minimumIntegerDigits: 2 });
    const pageTimer =  document.getElementById('timer');
    const timespan = new Date(pageTimer.dataset.time_out)
    const time_is_up = new bootstrap.Modal(document.getElementById('time_is_up'))

    if (!pageTimer.dataset.time_out) {
      return
    }

    document.getElementById('clock').style.visibility = 'visible';
    
    if (timespan > new Date()) {
      const units = countdown.HOURS | countdown.MINUTES | countdown.SECONDS;
      var timerID = countdown(timespan, (ts) => {
        pageTimer.innerHTML = `${format_value(ts.minutes)}:${format_value(ts.seconds)}`;
        if (ts.value >= 0) {
          clearInterval(timerID);
          time_is_up.show();
        }
      }, units);
    } else { 
      time_is_up.show();
    }

  })
}

export function Sorting() {
  document.getElementById('sortBy').addEventListener('click', () => {

    const table = document.getElementById('gists_table')
    
    table.order = -table.order || 1
    event.target.className  = table.order === 1 ? 'sorted_desc' : 'sorted_asc'
    
    let sortedRows = Array.from(table.rows)
      .slice(1)
      .sort((rowA, rowB) => rowA.cells[1].innerText > rowB.cells[1].innerText ? table.order : -table.order);

      table.tBodies[0].append(...sortedRows)
  })
}
