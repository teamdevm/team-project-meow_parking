import React, {useEffect} from 'react'
import { useNavigate } from 'react-router-dom'
import Header from "../Components/Header";
import { useState } from 'react'


export default function Login() {
    //
    const navigateTo=useNavigate()
    //состояние ввода
    const [formInput, setFormInput] = React.useState({
        email: "",
        password: "",
    })
    //обработчик форм
    const handleForm = () => {
        console.log(formInput)
        setFormInput({
            email: "",
            password: "",
        })
        alert('A form was submitted: '+ formInput.email +" " +formInput.password);
        fetch('http://localhost:3000/store-data', {
        method: 'POST',
            // We convert the React state to JSON and send it as the POST body
        body: JSON.stringify({email: formInput.email, password:formInput.password})
        }).then(response => response.json())
        .then(data => setFormInput({ email: data.email, password:data.password}));
    }

  return (
    //описание фона
    <div className=" bg-green-200 relative flex flex-col justify-center min-h-screen overflow-hidden">
        <Header />
        <script>/* описание окна авторизации*/</script>
        <div className="w-full p-6 m-auto bg-white rounded-md ring ring-2 ring-transparent lg:max-w-xl">
            <h1 className="text-3xl font-montesserat text-center text-black">
              Авторизация
            </h1>
            <form >
            <script>/* описание email */</script>
              <div className="mb-2">
                <label
                    for="email"
                    className="block text-sm font-montesserat text-gray-800"
                >
                    Почта
                </label>
                <script>/*значение value для передачи введеных значений пароля и почты в useState*/</script>
                <script>/*setFormInput формула для чтения данных с формы*/</script>
                <input  
                    onChange={(e)=>setFormInput({ ...formInput, email: e.target.value })}              
                    value={formInput.email}
                    type="email"
                    className="block w-full px-4 py-2 mt-2 text-purple-700 bg-white border rounded-md focus:border-purple-400 focus:ring-purple-300 focus:outline-none focus:ring focus:ring-opacity-40"
                />
              </div>
              <script>/* описание пароля*/</script>
              <div className="mb-2">
                <label
                    for="password"
                    className="block text-sm font-montesserat text-gray-800"
                >
                    Пароль
                </label>
                <input
                    onChange={(e)=>setFormInput({ ...formInput, password: e.target.value })}                              
                    value={formInput.password}
                    type="password"
                    className="block w-full px-4 py-2 mt-2 text-purple-700 bg-white border rounded-md focus:border-purple-400 focus:ring-purple-300 focus:outline-none focus:ring focus:ring-opacity-40"
                />
              </div>
              <script>/* ненужная кнопка забыли пароль
                 <a href="#" className="text-xs font-montesserat text-purple-600 hover:underline"
                  > Забыли пароль?
              </a>
              */</script>
              <script>/* описание кнопки авторизации*/</script>
              <div className="mt-6">
                    <button onClick={()=>{handleForm()}} className="w-full px-4 py-2 font-montesserat tracking-wide text-black transition-colors duration-200 transform bg-blue-100 rounded-md hover:bg-purple-600 focus:outline-none focus:bg-purple-600">
                        Авторизоваться
                    </button>
                </div>
            </form>
            <script>/* описание кнопки для регистрации*/</script>
            <p className="font-montesserat">
                Ещё нету аккаунта?
                <b 
                    onClick={() => navigateTo("/signup")} 
                    className="font-montesserat hover: underline cursor-pointer"
                >
                    Зарегестрируйтесь
                </b>
            </p>
        </div>
    </div>
  )
}
