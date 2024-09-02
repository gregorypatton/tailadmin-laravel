<template>
  <app-layout>
    <template #header>Grid</template>
    <template #subHeader>Grid system for contents</template>
    <template #default>
      <grid-section :col-tablet="2" :col-laptop="3" :col-desktop="4">
        <div v-for="i in 6"
             class="flex items-center justify-center h-16 text-xl font-bold bg-gray-300 border border-gray-500">
          {{ 'Col ' + i }}
        </div>
      </grid-section>
    </template>
  </app-layout>
</template>

<script>
import AppLayout from "@/Layouts/AppLayout.vue";
import GridSection from "@/Layouts/GridSection.vue";

export default {
  name: "Grid",
  components: {GridSection, AppLayout},
}
</script>

<style scoped>

</style>
