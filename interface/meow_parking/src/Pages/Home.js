import React,{Component} from 'react'
import Header from "../Components/Header";
import axios from 'axios'
import {withRouter} from '../Components/withRouter';

class Home extends Component{

  constructor(props){
    super(props)
    //для перехода по страницам
    this.navigateToHome=this.navigateToHome.bind(this);
    this.navigateToLogin=this.navigateToLogin.bind(this);
    this.navigateToSignUp=this.navigateToSignUp.bind(this);
    //
    this.state={
        search:'',
        is_firsttime:true,
        Records:[]
      
    }
  }


  validate(){
    let search=this.state.search;
    let isValid = true;

    if(!search){
        isValid=false;
    }
    return isValid;
  }

  navigateToHome()
  {
      this.props.navigate('/home')
  } 
  navigateToLogin()
  {
      this.props.navigate('/')
  } 
  navigateToSignUp()
  {
      this.props.navigate('/signup')
  }


  changeHandler=(e)=>{
    this.setState({[e.target.name]:e.target.value})
  }

  async componentDidMount(){
    if(this.state.is_firsttime){
        fetch('http://127.0.0.1:8000/api/home')
        .then(result=>result.json().then((jsonResult)=>{
          this.setState({Records: jsonResult,is_firsttime:false})
          console.log("Recieved Details")
      })).catch((err)=>{
        console.error(err.message)
      })
    }
  }

  //loadHandler =async e=>{
  //  
  //  if(this.state.is_firsttime){
  //    try{
  //     const response =await fetch('http://127.0.0.1:8000/api/home')
  //      if(response.ok){
  //        console.log("sucsessful");
  //        let reschecked=response;
  //        let info = await reschecked.json();
  //        console.log(info);
  //        this.setState({
  //          Records:info.data,
  //          is_firsttime:false
  //        })
//
  //      }
  //      else {console.log("unsecsessful")}
  //    }
  //    catch(err){
  //      console.error(err.message);
  //    }
  //  }
 // }


  submitHandler =async e=>{
    e.preventDefault()
    if(this.validate())
      {
        console.log(this.state)
        //datta to POST send
        let l_data = {
          search: this.state.search
        }
        const requestOptions = {
          method: 'POST',
          headers: { 'Content-Type': 'application/json','accept': 'application/json'},
          body: JSON.stringify(l_data)
        };

        //fetch async
        try{
          const response =await fetch('http://127.0.0.1:8000/api/home', requestOptions)
          if(response.ok){
            console.log("sucsessful");
            let reschecked=response;
            let info = await reschecked.json();
            
            //проверка на правильность ввода данных
            if(info.hasOwnProperty("False")){
              console.log(info)
              console.log("False")
              
              let passerr="Неверный пароль или почта";
              let emailerr="Неверный пароль или почта";
              let password=''
              this.setState({
                passerr:passerr,
                emailerr:emailerr,
                password:password
              })
            }
            else if(info.hasOwnProperty("Yes")){
              console.log(info)
              console.log("Yes")
              this.navigateToHome();
            }
          }
          else {console.log("unsecsessful")}
        }
        catch(err){
          console.error(err.message);
        }
      }
  }
  render(){
    //состояние ввода
    const{search,Records}=this.state;
    
    return(
      <div className=" bg-green-200 relative font-montesserat flex flex-col min-h-screen overflow-hidden">
      <div>
        <div class="relative">
          <p><Header /></p>
          <button 
                      onClick={this.navigateToLogin}
                      type="submit" class="gap-4 text-black  rounded-br-2xl absolute right-0.5 bottom-0.5 bg-transparent hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium text-sm px-4 py-2 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Выход</button>
                
        </div>
        
        <div className="w-full p-6 m-auto bg-transparent rounded-md ring ring-4 ring-transparent lg:max-w-7xl">
        <form>   
                <label for="default-search" class="mb-2 text-sm font-medium text-gray-900 sr-only dark:text-gray-300">Search</label>
                <div class="relative">
                    <div class="flex absolute inset-y-0 left-0 items-center pl-3 pointer-events-none">
                        <svg class="w-5 h-5 text-gray-500 dark:text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path></svg>
                    </div>
                    <input 
                      onChange={this.changeHandler}                              
                      value={search}
                      type="text"
                      name="search"
                      id="default-search" 
                      class="block p-4 pl-10 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Поиск парковок" required/>
                    <button 
                      onClick={this.submitHandler}
                      type="submit" class="text-black absolute right-2.5 bottom-2.5 bg-gray-400 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2 dark:bg-blue-600 dark:hover:bg-blue-700 hover:text-white dark:focus:ring-blue-800">Поиск</button>
                </div>
            </form>
        </div>
        <div className="w-11/12 p-2 m-auto bg-white rounded-md ring ring-2 ring-transparent lg:max-w-6xl">
          {
            Records && Records.map(record =>{
              return(
                <div className="w-full border-black p-2 m-auto bg-grey rounded-md ring ring-2 ring-transparent lg:max-w-6xl">
                <button 
                  onClick={this.navigateToHome}
                  type='button'
                  class="text-xl ring-1 ring-grey-200 border-black text-black font-montesserat w-full py-1 px-2 inline-flex justify-center items-center gap-2 rounded-md border border-transparent font-semibold bg-white-400 hover:bg-indigo-400 hover:text-black focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2 transition-all text-sm sm:p-12 dark:focus:ring-offset-gray-800"
                  key={record.id}>
                  <strong>{record.street} | </strong><br />
                  {record.city}<br /><br />
                  </button>
                  </div>
              )
            })
          }
        
        </div>

      </div>
    </div>
    )
  }
}
export default withRouter(Home)
