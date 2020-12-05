<template>
    <div>
        <h1>Book List</h1>

        <div v-if="pleaseWait" class="text-warning">
            <h3>Please wait...</h3>
        </div>

        <table class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>ISBN</th>
                    <th>Title</th>
                    <th>Author</th>
                    <th>Description</th>
                    <th>Year</th>
                    <th>Publisher</th>
                    <th>Date</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="book in books" :key="book._id">
                    <td>{{book.isbn}}</td>
                    <td>{{book.title}}</td>
                    <td>{{book.author}}</td>
                    <td>{{book.description}}</td>
                    <td>{{book.published_year}}</td>
                    <td>{{book.publisher}}</td>
                    <td>{{ formatDate(book.updated_date) }}</td>
                    <td>
                        <a href="#" @click.prevent="populateBookToEdit(book)">Edit</a> -
                        <a href="#" @click.prevent="deleteBook(book._id)">Delete</a>
                    </td>
                </tr>
            </tbody>
        </table>

        <br/>
        <br/>

        <div id="bookform" class="bg-secondary text-white">
            <h2>{{ (model._id ? 'Edit Post ID#' + model._id : 'New Post') }}</h2>
            <form @submit.prevent="saveBook">
                <div class="form-group">
                    <label for="isbn">ISBN:</label>
                    <input type="isbn" class="form-control" id="isbn" v-model="model.isbn">
                </div>
                <div class="form-group">
                    <label for="title">Title:</label>
                    <input type="title" class="form-control" id="title" v-model="model.title">
                </div>
                <div class="form-group">
                    <label for="author">Author:</label>
                    <input type="author" class="form-control" id="author" v-model="model.author">
                </div>
                <div class="form-group">
                    <label for="description">Description:</label>
                    <input type="description" class="form-control" id="description" v-model="model.description">
                </div>
                <div class="form-group">
                    <label for="published_year">Published Year:</label>
                    <input type="published_year" class="form-control" id="published_year" v-model="model.published_year">
                </div>
                <div class="form-group">
                    <label for="publisher">Publisher:</label>
                    <input type="publisher" class="form-control" id="publisher" v-model="model.publisher">
                </div>
                <div>
                    <input type="submit" value="Save"/>
                    <input type="button" @click.prevent="cancelBook()" value="Cancel"/>
                </div>
            </form>
        </div>        

        <br/>
        <br/>

    </div>
</template>

<style scoped>
    .table { 
        padding: 20px; width: 80%; margin: auto; 
    }
    td {
        color: var(--color-text);
    }
    tr {
        color: var(--color-text);
    }
    tr:nth-child(odd) {
        background: var(--color-article-background);
    }
    tr:nth-child(even) {
        background: var(--color-article-background);
    }
    #bookform {
        padding: 20px; width: 40%; margin: auto; 
    }
</style>

<script>
import moment from 'moment'
import axios from 'axios'

export default {
    name: 'BookList',
    data () {
        return {
            books: [],
            model: {},
            pleaseWait: false
        }
    },
    created () {
        this.getData()
    },
    methods: {
        getUrl() {
            return 'http://localhost:3000'
        },
        getData () {
            axios.get(this.getUrl() + '/book')
            .then(response => {
                this.books = response.data
            })
            .catch(e => {
                this.errors.push(e)
            })
        },
        populateBookToEdit (book) {
            this.model = book;
        },
        cancelBook () {
            this.model = {}
        },
        deleteBook (bookid) {
            if (confirm('Are you sure you want to delete this post?')) {
                axios.delete(this.getUrl() + '/book/' + bookid)
                .then((result) => {
                    console.log(result)
                    this.getData()
                })
                .catch(e => {
                    console.log(e)
                })
            }
        },
        saveBook() {
            console.log(this.model)
            console.log('this.model._id: ' + this.model._id)
            if  (this.model._id === undefined) {
                axios.post(this.getUrl() + '/book', this.model)
                .then(response => {
                    console.log(response)
                    this.getData()
                    this.cancelBook()
                })
                .catch(e => {
                    console.log(e)
                })
            } else {
                axios.put(this.getUrl() + '/book/' + this.model._id, this.model)
                .then(response => {
                    console.log(response)
                    this.getData()
                    this.cancelBook()
                })
                .catch(e => {
                    console.log(e)
                })                
            }
       },
       formatDate: function (value) {
            if (value) {
                return moment(String(value)).format('MM/DD/YYYY hh:mm a')
            }
        }
    }
}
</script>