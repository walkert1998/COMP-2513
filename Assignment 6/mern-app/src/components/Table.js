import React, { Component } from 'react';
import axios from 'axios';

class Table extends Component {
  
  DeleteBook= () =>{  
    axios.delete('http://localhost:8080/book/'+this.props.obj._id)  
      .then(json => {  
        debugger;
        if(json.data.Status==='Delete'){  
          alert('Record deleted successfully!!');  
      }  
    })  
  } 

  EditBook = () => {
    //call parent
    this.props.onEditClick(this.props.obj);
  }

  render() {
    return (
        <tr>
          <td>{this.props.obj.isbn}</td>
          <td>{this.props.obj.title}</td>
          <td>{this.props.obj.author}</td>
          <td>{this.props.obj.publisher}</td>
          <td>{this.props.obj.published_year}</td>
          <td>
            <button type="button" onClick={this.EditBook} className="btn btn-success">Edit</button>
            <button type="button" onClick={this.DeleteBook} className="btn btn-danger">Delete</button>
          </td>
        </tr>
    );
  }
}

export default Table;  