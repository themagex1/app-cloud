<script setup lang="ts">
import { ref } from 'vue';
import axios from 'axios';

const API = import.meta.env.VITE_BASE_URL

const props = defineProps<{
    game: {
        id: number,
        Name: string,
        Platform: string,
        Year: string,
        Genre: string,
        Publisher: string,
        NA_Sales: number,
        EU_Sales: number,
        JP_Sales: number,
        Other_Sales: number,
        Global_Sales: number,
    }
}>()

const name = ref(props.game.Name || '')
const platform = ref('')
const year = ref('')
const genre = ref('')
const publisher = ref('')
const naSales = ref(0)
const euSales = ref(0)
const jpSales = ref(0)
const otherSales = ref(0)
const globalSales = ref(0)

const putGame = async(id: number) => {
    await axios.put(API, {
        id: id,
        Name: name.value,
        Platform: platform.value,
        Year: year.value,
        Genre: genre.value,
        Publisher: publisher.value,
        NA_Sales: naSales.value,
        EU_Sales: euSales.value,
        JP_Sales: jpSales.value,
        Other_Sales: otherSales.value,
        Global_Sales: globalSales.value,
    })
    

}

</script>

<template>
    <div class="fixed top-0 bottom-0 left-0 right-0 bg-opacity-80">
        <div
            class=" bg-gray-900 absolute rounded top-0 bottom-0 left-0 right-0 p-4 w-[28rem] lg:w-[50rem] mx-auto max-h-[40rem] overflow-y-auto h-fit my-auto">
            <span>
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="white"
                    class="w-6 h-6 ml-auto cursor-pointer" @click="$emit('showEditModal')">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
                </svg>
            </span>

            <div>
                <div class="mb-6">
                    <label for="name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                        Name
                    </label>
                    <input type="text" id="name"
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                        placeholder="Type name" v-model="name">
                </div>
                <div class="mb-6">
                    <label for="platform" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                        Platform
                    </label>
                    <input type="text" id="platform"
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                        placeholder="Type platform" v-model="platform">
                </div>
                <div class="mb-6">
                    <label for="year" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                        Year
                    </label>
                    <input type="text" id="year"
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                        placeholder="Type year" v-model="year">
                </div>
                <div class="mb-6">
                    <label for="genre" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                        Genre
                    </label>
                    <input type="text" id="genre"
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                        placeholder="Type genre" v-model="genre">
                </div>
                <div class="mb-6">
                    <label for="publisher" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                        Publisher
                    </label>
                    <input type="text" id="publisher"
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                        placeholder="Type publisher" v-model="publisher">
                </div>
                <div class="mb-6">
                    <label for="na" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                        NA_Sales
                    </label>
                    <input type="text" id="na"
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                        placeholder="Type NA_Sales" v-model="naSales">
                </div>
                <div class="mb-6">
                    <label for="eu" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                        EU_Sales
                    </label>
                    <input type="text" id="eu"
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                        placeholder="Type EU_Sales" v-model="euSales">
                </div>
                <div class="mb-6">
                    <label for="jp" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                        JP_Sales
                    </label>
                    <input type="text" id="jp"
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                        placeholder="Type JP_Sales" v-model="jpSales">
                </div>
                <div class="mb-6">
                    <label for="other" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                        Other_Sales
                    </label>
                    <input type="text" id="other"
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                        placeholder="Type Other_Sales" v-model="otherSales">
                </div>
                <div class="mb-6">
                    <label for="global" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                        Global_Sales
                    </label>
                    <input type="text" id="global"
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                        placeholder="Type Global_Sales" v-model="globalSales">
                </div>
                <button @click="putGame(props.game.id), $emit('showEditModal')"
                    class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Send
                    game
                </button>
            </div>


        </div>

    </div>
</template>