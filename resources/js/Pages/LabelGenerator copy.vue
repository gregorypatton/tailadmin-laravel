<template>
  <app-layout title="Label Generator">
    <template #header>Generate Labels from SKUs in Database</template>
    <template #subHeader>To get started, select a SKU and count.</template>
    <template #default>
  <div>
    <LabelForm />
  </div>
    </template>
  </app-layout>
</template>

<script>
import { Head } from "@inertiajs/vue3";
import AppLayout from "@/Layouts/AppLayout.vue";
import LabelForm from '@/Components/Labels/LabelForm.vue';

export default {
  name: "LabelGenerator",
  components: {LabelForm, AppLayout},
}
</script>
