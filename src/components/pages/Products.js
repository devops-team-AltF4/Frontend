import React, { useSyncExternalStore } from 'react';
import '../../App.css';
import { useState, useEffect } from 'react'


import axios from 'axios'
axios.defaults.withCredentials = true;

export default function Products() {
  const [state, setState] = useState()
  useEffect(() => {
    axios.get('http://eks.devops-altf4.click/auth')
  .then(function (response) {
    console.log(response.data, state);
    setState(response.data)
  })
      
    return () => {
      
    };
  }, []);
  

  return <h1 className='products'>{state}</h1>
}
