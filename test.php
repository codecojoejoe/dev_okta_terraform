<!DOCTYPE html>
<html>
  <head>
    <title>Vue.js App</title>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
  </head>
  <body>
    <div id="app">
      <h1>Todo List</h1>
      <ul>
        <li v-for="item in items">{{ item }}</li>
      </ul>
      <form v-on:submit.prevent="addItem">
        <input type="text" v-model="newItem">
        <button type="submit">Add Item</button>
      </form>
    </div>
    
    <script>
      var app = new Vue({
        el: '#app',
        data: {
          items: ['item 1', 'item 2', 'item 3'],
          newItem: ''
        },
        methods: {
          addItem: function() {
            this.items.push(this.newItem);
            this.newItem = '';
          }
        }
      });
    </script>
  </body>
</html>