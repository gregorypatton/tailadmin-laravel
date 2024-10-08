<template>
  <div ref="target" class="relative select-none">
    <!--Adding Form-->
    <div :class="['input border pl-2 h-10 items-center cursor-pointer hover:border-blue-500 relative', radiusStyle]"
         @click="showPanel=!showPanel">
      <!--Placeholder-->
      {{ modelValue.length === 0 ? 'No items found' : modelValue.length + ' items' }}
      <!--Items and Add Form Showing Button-->
      <t-chevron-down-icon
          :class="[
                'absolute right-2 w-5 h-5 transform duration-300',
                showPanel ? 'rotate-90' : 'rotate-0'
                ]"
      />
    </div>

    <!--Panel-->
    <div
        v-if="showPanel"
        class="absolute z-10 flex flex-col w-full px-2 py-4 mt-2 space-y-2 border border-gray-300 rounded-md shadow shadow-inner bg-gradient-to-t from-gray-200 to-gray-100">
      <!--Fields-->
      <div class="flex flex-row items-center">
        <!--Conditional View-->
        <input v-if="value1name"
               v-model="value1"
               :class="value2name == null ? 'rounded-md border' : 'md:rounded-l md:rounded-r-none md:border-r-0'" :placeholder="value1name" class="flex w-full p-2 border-gray-300 rounded" name="value1"
               type="text"/>
        <input v-if="value2name" v-model="value2" :placeholder="value2name" class="flex w-full p-2 border border-gray-300 rounded md:rounded-r md:rounded-l-none"
               name="value2"
               type="text"/>
        <!--Add Button-->
        <div class="flex items-center justify-center h-10 ml-1">
          <t-button color="green" type="button" @click="addItem">
            <t-plus-circle-icon class="w-6 h-6 md:w-5 md:h-5"/>
            <span class="hidden pr-2 md:block">Add</span>
          </t-button>
        </div>
      </div>
      <div v-if="emptyMessage != null" class="text-sm text-red-500">{{ emptyMessage }}</div>
      <!--Header-->
      <div v-if="modelValue.length >0"
           class="grid items-center w-full grid-cols-12 px-2 py-1 space-x-2 font-bold border-b border-gray-300 ">
        <span class="col-span-1"></span>
        <span class="col-span-5">{{ value1name }}</span>
        <span class="col-span-5">{{ value2name }}</span>
        <span class="col-span-1"></span>
      </div>
      <!--Items-->
      <div v-for="(item,index) in modelValue" :key="index"
           class="grid items-center grid-cols-12 px-2 py-1 space-x-2 border rounded-md bg-gray-50">
        <!--Counter-->
        <span class="col-span-1">{{ index + 1 }}.</span>
        <!--Fields-->
        <span class="col-span-5">{{ item.value1 }}</span>
        <span class="col-span-5">{{ item.value2 }}</span>
        <!--Delete Button-->
        <span class="col-span-1" @click="deleteItem(index)">
                     <t-trash-icon class="w-6 h-5 text-red-500 cursor-pointer"/>
                </span>
      </div>
      <!--Close Button-->
      <t-button color="white" size="sm" type="button" @click="showPanel=false">
        Close
      </t-button>
    </div>
  </div>
</template>

<script>
/*Main Functions*/
import {ref, toRefs} from "vue";
import { onClickOutside } from "@vueuse/core";
import {radiusSizeMixin} from "@/Mixins/radiusSizeMixin";

/*Components*/
import TPlusCircleIcon from "@/Components/Icon/TPlusCircleIcon.vue";
import TTrashIcon from "@/Components/Icon/TTrashIcon.vue";
import TButton from "@/Components/Button/TButton.vue";
import TChevronDownIcon from "@/Components/Icon/TChevronDownIcon.vue";

export default {
  props: {
      value1name : {
          type: String,
          default: null
      },
      value2name: {
      type: String,
      default: null
  },
      modelValue: {
          type: [Object, Array],
          default: null
      }

},
  components: {
    TChevronDownIcon,
      TButton,
    TTrashIcon,
    TPlusCircleIcon,
  },

  mixins: [radiusSizeMixin],

    emits: ['update:modelValue'],

    setup(props, {emit}){
      const { value2name, modelValue} = toRefs(props)
      const value1 = ref();
      const value2 = ref();
      const showPanel = ref();
      const emptyMessage = ref();

      /*Show-hide Panel*/
      const target = ref();
        onClickOutside(target, () => showPanel.value = false);

        /*Reset*/
        const reset = ()=>{
            value1.value = null;
            value2.value = null;
            emptyMessage.value = null;
        }

        const addItem = () => {
            if (value2name.value != null) {
                if (value1.value == null || value2.value == null) {
                    emptyMessage.value = 'Please fill in the fields';
                    window.setTimeout(() => {
                        emptyMessage.value = null;
                    }, 3000);
                } else {
                    let newValue = [...modelValue.value]
                    newValue.push({value1: value1.value, value2: value2.value});
                    emit('update:modelValue', newValue);
                    reset();
                }
            } else {
                if (value1.value == null) {
                    emptyMessage.value = 'Please fill in the fields';
                    window.setTimeout(() => {
                        emptyMessage.value = null;
                    }, 3000);
                } else {
                    let newValue = [...modelValue.value]
                    newValue.push({value1: value1.value});
                    emit('update:modelValue', newValue);
                    reset();
                }
            }
        }

        const deleteItem = (index) => {
          modelValue.value.splice(index,1)
        }

        return{
            value1,
            value2,
            showPanel,
            emptyMessage,
            target,
            addItem,
            deleteItem,
            reset
        }
    },
}
</script>
