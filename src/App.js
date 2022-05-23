import './App.css';
import { useState, useEffect } from 'react'

function App() {

  const [msg, setMsg] = useState('서버 연결 중')

  useEffect(() => {
    fetch(process.env.REACT_APP_API_SERVER_ENDPOINT)
    .then(resp => resp.json())
    .then(json => setMsg(json))
    .catch(() => setMsg('연결 안됨'))
  }, [])

  console.log(process.env.REACT_APP_API_SERVER_ENDPOINT)

  return (
    <div className="App">
      <header className="App-header">
        <div>{JSON.stringify(msg)}</div>
        <a
          className="App-link"
          href="https://codestates.com"
          target="_blank"
          rel="noopener noreferrer"
        >
          Hello CodeStates
        </a>
      </header>
    </div>
  );
}

export default App;
