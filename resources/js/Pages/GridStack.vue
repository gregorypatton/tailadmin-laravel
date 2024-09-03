<template>
  <app-layout title="Grid Layout">
    <template #header>Grid Layout</template>
    <template #subHeader>Arrange Your Labels</template>
    <template #default>
      <div>
        <GridStackComponent />
      </div>
    </template>
  </app-layout>
</template>

<script>
import AppLayout from "@/Layouts/AppLayout.vue";
import GridStackComponent from '@/Components/Labels/GridStackComponent.vue';

export default {
  name: "GridStack",
  components: { GridStackComponent, AppLayout },
}
</script>
