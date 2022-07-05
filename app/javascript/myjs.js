
// export function Sorting() {
//   document.getElementById('sortBy').addEventListener('click', () => {

//     const table = document.getElementById('gists_table')
    
//     table.order = -table.order || 1
//     event.target.className  = table.order === 1 ? 'sorted_desc' : 'sorted_asc'
    
//     let sortedRows = Array.from(table.rows)
//       .slice(1)
//       .sort((rowA, rowB) => rowA.cells[1].innerText > rowB.cells[1].innerText ? table.order : -table.order);

//       table.tBodies[0].append(...sortedRows)
//   })
// }