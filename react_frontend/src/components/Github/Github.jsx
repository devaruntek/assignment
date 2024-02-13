import React from 'react'
import {useState, useEffect} from 'react'
import { useLoaderData } from 'react-router-dom'
import Login from '../Login/Login'

function Github() {
	const data = useLoaderData()
  function getToken() {
		const tokenString = sessionStorage.getItem('token')
		const userToken = JSON.parse(tokenString)
		return userToken
	}

	const [token, setToken] = useState("");
  useEffect(()=> {
    setToken(getToken())
  },[])
   
    if(!token){
        {return <Login />}
    }
  return (
    <>
			<div className='bg-gray-700 text-3xl text-white p-4 text-center'> Followers: {data?.followers}</div>
			<div className='p-4'><img src={data?.avatar_url} width={300} /></div>
    </>
  )
}

export default Github

export const githubInfoLoader = async () => {
	const response = await fetch('https://api.github.com/users/tekwanigit')
	return response.json()
}