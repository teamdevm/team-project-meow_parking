//в js файл, пытался отправить запрос
import React from 'react'
[{
  'id':'1',
  'city':'Perm',
  'street':'Plehanova 5',
  'latitude':'22727272727',
  'longitude':'88858585',
  'links_to_maps':'some_link1'
},
{
  
  'id':'2',
  'city':'Afganistan',
  'street':'Alach Ak Bar 13',
  'latitude':'22adds727272727',
  'longitude':'88dasdasd858585',
  'links_to_maps':'some_link2'
},
{
  
  'id':'3',
  'city':'Kazahstan',
  'street':'Anananas',
  'latitude':'22adds72727dsd2727',
  'longitude':'88dasdasd858585',
  'links_to_maps':'some_lisdnk2'
}
]
class MyForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = { name: '' };
  }
 
  handleChange = (event) => {
    this.setState({[event.target.name]: event.target.value});
  }
 
  handleSubmit = (event) => {
    alert('A form was submitted: ' + this.state);
 
    fetch('http://localhost:3000/store-data', {
       method: 'POST',
        // We convert the React state to JSON and send it as the POST body
       body: JSON.stringify(this.state)
      }).then(function(response) {
        console.log(response)
        return response.json();
      });
  
    event.preventDefault();
}
 
  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <label>
          Name:
          <input type="text" value={this.state.value} name="name" onChange={this.handleChange} />
        </label>
        <input type="submit" value="Submit" />
      </form>
    );
  }
}
 
export default MyForm;