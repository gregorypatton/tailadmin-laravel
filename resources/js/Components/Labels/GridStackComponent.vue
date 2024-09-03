<template>
  <draggable-resizable-vue
    v-model:x="element.x"
    v-model:y="element.y"
    v-model:h="element.height"
    v-model:w="element.width"
    v-model:active="element.isActive"
  />

  <draggable-resizable-vue
    v-model:x="element2.x"
    v-model:y="element2.y"
    v-model:h="element2.height"
    v-model:w="element2.width"
    v-model:active="element2.isActive"
  />
</template>

<script setup>
import { ref } from 'vue'
import DraggableResizableVue from 'draggable-resizable-vue3'

const element = ref({
  x: 20,
  y: 20,
  width: 200,
  height: 200,
  isActive: false,
})
const element2 = ref({
  x: 202,
  y: 202,
  width: 20,
  height: 20,
  isActive: false,
})
</script>
