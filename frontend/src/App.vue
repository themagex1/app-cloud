<script lang="ts" setup>

import { ref, onMounted, computed } from 'vue';
import axios from 'axios'
import GameForm from './components/GameForm.vue';
import EditGame from './components/EditGame.vue';
const API = import.meta.env.VITE_BASE_URL

//style

const evenClass = ref('bg-white border-b dark:bg-gray-900 dark:border-gray-700')
const oddClass = ref('bg-gray-50 dark:bg-gray-800 dark:border-gray-700')

//search button
const searchInput = ref('')

//get

interface Games {
  id: number,
  name: string,
  platform: string,
  year: string,
  genre: string,
  publisher: string,
  na_sales: number,
  eu_sales: number,
  jp_sales: number,
  other_sales: number,
  global_sales: number

}



const games = ref<Games[]>([])

const modalButton = ref(false)
const editModal = ref(false)

const search = async () => {
  games.value = []
  const getResponse = await axios.get<Games[]>(API + '/' + searchInput.value)
  const game = computed(() => games.value = getResponse.data)
  games.value = game.value
}


onMounted(async () => {
  const gamesResponse = await axios.get<Games[]>(API)
  games.value = gamesResponse.data
})

</script>

<template>
  <div class="mt-10 bg-gray-600">
    <div class="flex">
      <div class="searchbar w-1/2 mb-4 ml-10">
        <label for="default-search" class="mb-2 text-sm font-medium text-gray-900 sr-only dark:text-white">Search</label>
        <div class="relative">
          <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
            <svg aria-hidden="true" class="w-5 h-5 text-gray-500 dark:text-gray-400" fill="none" stroke="currentColor"
              viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
            </svg>
          </div>
          <input type="search" id="default-search" v-model="searchInput"
            class="block w-full p-4 pl-10 text-sm text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
            placeholder="Search..." required>
          <button type="submit" @click="search"
            class="text-white absolute right-2.5 bottom-2.5 bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Search</button>
        </div>
      </div>
      <div class="ml-auto mr-10">
        <button @click="modalButton = true" type="button" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800">Add a game</button>
      </div>
      <div v-if="modalButton">
        <GameForm @showModal="modalButton = false"/>
      </div>
    </div>




    <div class=" overflow-x-auto shadow-md sm:rounded-lg">
      <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
          <tr>
            
            <th scope="col" class="px-6 py-3">
              Name
            </th>
            <th scope="col" class="px-6 py-3">
              Platform
            </th>
            <th scope="col" class="px-6 py-3">
              Year
            </th>
            <th scope="col" class="px-6 py-3">
              Genre
            </th>
            <th scope="col" class="px-6 py-3">
              Publisher
            </th>
            <th scope="col" class="px-6 py-3">
              NA_Sales
            </th>
            <th scope="col" class="px-6 py-3">
              EU_Sales
            </th>
            <th scope="col" class="px-6 py-3">
              JP_Sales
            </th>
            <th scope="col" class="px-6 py-3">
              Other_Sales
            </th>
            <th scope="col" class="px-6 py-3">
              Global_Sales
            </th>
            <th scope="col" class="px-6 py-3">
              Manage
            </th>
          </tr>
        </thead>
        <tbody>
          <tr :class="[(game.id % 2 == 0) ? evenClass : oddClass]" v-for="game in games" :key="game.id">
            <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
              {{ game.name }}
            </th>
            <td class="px-6 py-4">
              {{ game.platform }}
            </td>
            <td class="px-6 py-4">
              {{ game.year }}
            </td>
            <td class="px-6 py-4">
              {{ game.genre }}
            </td>
            <td class="px-6 py-4">
              {{ game.publisher }}
            </td>
            <td class="px-6 py-4">
              {{ game.na_sales }}
            </td>
            <td class="px-6 py-4">
              {{ game.eu_sales }}
            </td>
            <td class="px-6 py-4">
              {{ game.jp_sales }}
            </td>
            <td class="px-6 py-4">
              {{ game.other_sales }}
            </td>
            <td class="px-6 py-4">
              {{ game.global_sales }}
            </td>
            <td class="px-6 py-4">
              <div @click="editModal = true" pro class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Edit</div>
            </td>

            <div v-if="editModal">
              <EditGame :game=game @showEditModal="editModal = false"/>
            </div>
          </tr>

          
        </tbody>
      </table>
      
    </div>
    
  </div>
</template>

<style scoped>
.logo {
  height: 6em;
  padding: 1.5em;
  will-change: filter;
  transition: filter 300ms;
}

.logo:hover {
  filter: drop-shadow(0 0 2em #646cffaa);
}

.logo.vue:hover {
  filter: drop-shadow(0 0 2em #42b883aa);
}
</style>
