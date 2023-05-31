import React from 'react'
import Header from "../Components/Header";
import Search from "../Components/Search";



export default function Home() {

  //состояние ввода
  const [formInput, setFormInput] = React.useState({
    search: ""
})
//обработчик форм
const handleForm = () => {
    console.log(formInput)
    setFormInput({
        search: ""
    })
    alert('A form was submitted: '+ formInput.search);
    fetch('http://localhost:3000/store-data', {
    method: 'POST',
        // We convert the React state to JSON and send it as the POST body
    body: JSON.stringify({search: formInput.search})
    }).then(response => response.json())
    .then(data => setFormInput({ search: data.search}));
}
  return (
    <div className=" bg-green-200 relative font-montesserat flex flex-col min-h-screen overflow-hidden">
      <div>
        <div class="relative">
          <p><Header /></p>
          <button 
                      onClick={()=>{handleForm()}}
                      type="submit" class="gap-4 text-black  rounded-br-2xl absolute right-0.5 bottom-0.5 bg-transparent hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium text-sm px-4 py-2 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Личный кабинет</button>
                
        </div>
        
        <div className="w-full p-6 m-auto bg-transparent rounded-md ring ring-4 ring-transparent lg:max-w-7xl">
        <form>   
                <label for="default-search" class="mb-2 text-sm font-medium text-gray-900 sr-only dark:text-gray-300">Search</label>
                <div class="relative">
                    <div class="flex absolute inset-y-0 left-0 items-center pl-3 pointer-events-none">
                        <svg class="w-5 h-5 text-gray-500 dark:text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path></svg>
                    </div>
                    <input 
                      onChange={(e)=>setFormInput({ ...formInput, search: e.target.value })}                              
                      value={formInput.search}
                      type="search" id="default-search" class="block p-4 pl-10 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Поиск парковок" required/>
                    <button 
                      onClick={()=>{handleForm()}}
                      type="submit" class="text-black absolute right-2.5 bottom-2.5 bg-gray-400 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2 dark:bg-blue-600 dark:hover:bg-blue-700 hover:text-white dark:focus:ring-blue-800">Поиск</button>
                </div>
            </form>
        </div>
        <div className="w-full p-6 m-auto bg-transparent rounded-md ring ring-2 ring-transparent lg:max-w-4xl">
        <button 
          onClick={()=>{handleForm()}}
          type="button" class="border-black font-montesserat text-black w-full py-3 px-4 inline-flex justify-center items-center gap-2 rounded-md border border-transparent font-semibold bg-indigo-400 hover:bg-indigo-600 hover:text-white focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2 transition-all text-sm sm:p-12 dark:focus:ring-offset-gray-800">
          Список автостоянок
        </button>
        </div>
        <div className="w-full p-6 m-auto bg-transparent rounded-md ring ring-2 ring-transparent lg:max-w-4xl">
        <button 
          onClick={()=>{handleForm()}}
          type="button" class="border-black text-black font-montesserat w-full py-3 px-4 inline-flex justify-center items-center gap-2 rounded-md border border-transparent font-semibold bg-green-400 hover:bg-green-700 hover:text-white focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2 transition-all text-sm sm:p-12 dark:focus:ring-offset-gray-800">
          Избранные автостоянки
        </button>
        </div>

      </div>
    </div>
  )
}
