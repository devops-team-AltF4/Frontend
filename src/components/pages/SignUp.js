import React from 'react';
import '../../App.css';
import { useState, useEffect } from 'react'

export default function SignUp() {
  const [msg, setMsg] = useState('서버 연결 중')

  useEffect(() => {
    fetch(process.env.REACT_APP_API_SERVER_ENDPOINT)
    .then(resp => resp.json())
    .then(json => setMsg(json))
    .catch(() => setMsg('연결 안됨'))
  }, [])

  return <h1 className='sign-up'>{JSON.stringify(msg)}</h1>;
}
