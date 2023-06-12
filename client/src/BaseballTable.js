// import { useState, useEffect } from 'react'
// import axios from 'axios'

// // 3010 포트 도메인
// // URL 맨 뒤에 / (슬래시) 없어야 하므로 주의할 것
// const EXPRESS_URL = 'https://favoritebaseball0734.run.goorm.site'

// function BaseballTable() {
//   const [items, setItem] = useState([])
//   useEffect(() => {
//     (async () => {
//       const res = await axios.get(EXPRESS_URL + '/player')
//       setItem(res.data)
//     })()
//   }, [])
  
//   return (
//     <table>
//       <thead>
//         <tr><th>사진</th><th>리그</th><th>팀</th><th>이름</th><th>포지션</th><th>나이</th><th>WAR</th></tr>
//       </thead>
//       <tbody>
//         { items.map( (player, i) => <tr key={i}>
//             { 
//               player.picture == null
//               ? <td/>
//               : <td><img src={process.env.PUBLIC_URL + `/images/${player.picture}.jpg`} alt='사진'/></td>
//             }
// 			<td>{player.league}</td>
//          <td>{player.tname}</td>
//          <td>{player.pname}</td>
//          <td>{player.position}</td>
// 			<td>{player.age}</td>
// 			<td>{player.war}</td>
//             </tr>) }
//       </tbody>
//     </table>
//   )
// }

// export default BaseballTable
import { useState, useEffect } from 'react'
import axios from 'axios'

import Paper from '@mui/material/Paper';
import Table from '@mui/material/Table';
import TableBody from '@mui/material/TableBody';
import TableCell from '@mui/material/TableCell';
import TableContainer from '@mui/material/TableContainer';
import TableHead from '@mui/material/TableHead';
import TableRow from '@mui/material/TableRow';
import Fab from '@mui/material/Fab';
import RefreshIcon from '@mui/icons-material/Refresh';


// 3010 포트 도메인
// URL 맨 뒤에 / (슬래시) 없어야 하므로 주의할 것
const EXPRESS_URL = 'https://favoritebaseball0734.run.goorm.site'

function BaseballTable() {
  const [items, setItems] = useState([])
  useEffect(() => {
    refresh()
  }, [])
  
  async function refresh() {
    const res = await axios.get(EXPRESS_URL + '/player')
    console.log(res.data)
    setItems(res.data)
  }
  
  return (
    <Paper sx={{ width: '100%', overflow: 'hidden' }}>
      <Fab color="primary"
        sx={{
          position: "fixed",
          top: (theme) => theme.spacing(2),
          right: (theme) => theme.spacing(2)
        }}
        onClick={() => { refresh() }}>
        <RefreshIcon />
      </Fab>
      <TableContainer sx={{ maxHeight: 545 }}>
        <Table stickyHeader aria-label="sticky table">
          <TableHead>
            <TableRow>
              <TableCell>사진</TableCell>
              <TableCell>리그</TableCell>
              <TableCell>팀</TableCell>
              <TableCell>이름</TableCell>
			  <TableCell>포지션</TableCell>
			  <TableCell>나이</TableCell>
			  <TableCell>WAR</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            { items.map( (player, i) => <TableRow hover role="checkbox" key={i}>
                { 
                  player.picture == null
                  ? <TableCell/>
                  : <TableCell><img src={process.env.PUBLIC_URL + `/images/${player.picture}.jpg`} alt='사진'/></TableCell>
                }
				<TableCell>{player.league}</TableCell>
                <TableCell>{player.tname}</TableCell>
				<TableCell>{player.pname}</TableCell>
				<TableCell>{player.position}</TableCell>
				<TableCell>{player.age}</TableCell>
				<TableCell>{player.war}</TableCell>
                </TableRow>) }
          </TableBody>
        </Table>
      </TableContainer>
    </Paper>
  )
}

export default BaseballTable
