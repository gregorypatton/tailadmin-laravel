<template>
  <div>
    <Head :title="title" />

    <jet-banner />

    <div
      class="min-h-screen px-4 bg-gradient-to-l from-indigo-400 to-blue-400 dark:bg-gradient-to-b dark:from-indigo-900 dark:to-slate-900 sm:px-12"
    >
      <!-- Top Bar -->
      <div class="flex items-center justify-between h-20 text-white">
        <!-- Logo -->
        <div class="flex items-center space-x-2">
          <!-- TODO: [TAQ-128]Make dynamic with Media Library -->
          <Logo class="w-10 h-10 text-white" />
          <span v-text="$page.props.project_info" class="text-3xl" />
        </div>
        <!-- Right Side -->
        <div class="flex items-center justify-end space-x-2">
          <!-- Misc Menu -->
          <Link :href="route('setting')">
            <icon
              icon="cog"
              size="lg"
              class="w-8 h-8 transition-all duration-300 transform hover:-translate-y-1 active:translate-y-0 active:scale-90"
            />
          </Link>
          <!-- Dark Mode -->
          <div
            class="flex items-center justify-center w-8 h-8 overflow-hidden text-white transition-all duration-300 transform rounded-full cursor-pointer hover:scale-110 active:scale-90"
            @click="
              () => {
                if (darkMode === 'light') {
                  darkMode = 'dark';
                } else if (darkMode === 'dark') {
                  darkMode = 'auto';
                } else {
                  darkMode = 'light';
                }
              }
            "
          >
            <transition-group name="darkTransition">
              <!-- Light -->
              <i
                v-if="darkMode === 'light'"
                class="pi pi-sun"
                v-tooltip.bottom="tm('lightMode')"
                key="light"
                style="font-size: 1.3rem"
              ></i>
              <!-- Auto -->
              <i
                v-if="darkMode === 'auto'"
                class="pi pi-palette"
                v-tooltip.bottom="tm('auto')"
                key="auto"
                style="font-size: 1.3rem"
              ></i>
              <!-- Dark -->
              <i
                v-if="darkMode === 'dark'"
                class="pi pi-moon"
                v-tooltip.bottom="tm('darkMode')"
                key="dark"
                style="font-size: 1.3rem"
              ></i>
            </transition-group>
          </div>
          <!-- Search -->
          <div
            v-if="!showSearchBar"
            class="transition-all duration-300 transform cursor-pointer hover:-translate-y-1 active:translate-y-0 active:scale-90"
            @click="showSearchBar = !showSearchBar"
          >
            <icon icon="search" size="lg" />
          </div>
          <!-- User Menu -->
          <div></div>
        </div>
      </div>
      <!-- Search Bar -->
      <div v-if="showSearchBar" class="relative text-slate-500">
        <icon icon="search" size="lg" class="absolute top-[1.125rem] left-4" />
        <input
          v-model="searchText"
          class="w-full px-12 text-2xl bg-white border bg-opacity-60 h-14 rounded-t-md placeholder-slate-500"
          placeholder="Search"
        />
        <!-- Clear Icon -->
        <div
          v-if="searchText"
          @click="searchText = ''"
          class="flex rounded-full cursor-pointer hover:bg-white"
        >
          <icon
            icon="times"
            size="lg"
            class="absolute top-[1.125rem] right-12"
          />
        </div>

        <!-- Close Icon -->
        <icon
          @click="
            showSearchBar = false;
            searchText = '';
          "
          icon="level-up-alt"
          size="lg"
          class="absolute top-[1.125rem] right-4"
        />
      </div>
      <!-- Top Nav Bar -->
      <!-- Content -->
      <!-- Footer -->
      <nav class="bg-white border-b border-gray-100">
        <!-- Primary Navigation Menu -->
        <div class="px-4 mx-auto max-w-7xl sm:px-6 lg:px-8">
          <div class="flex justify-between h-16">
            <div class="flex">
              <!-- Logo -->
              <div class="flex items-center shrink-0">
                <Link :href="route('dashboard')">
                  <jet-application-mark class="block w-auto h-9" />
                </Link>
              </div>

              <!-- Navigation Links -->
              <div class="hidden space-x-8 sm:-my-px sm:ml-10 sm:flex">
                <jet-nav-link
                  :href="route('dashboard')"
                  :active="route().current('dashboard')"
                >
                  Dashboard
                </jet-nav-link>
              </div>
            </div>

            <div class="hidden sm:flex sm:items-center sm:ml-6">
              <div class="relative ml-3">
                <!-- Teams Dropdown -->
                <jet-dropdown
                  align="right"
                  width="60"
                  v-if="$page.props.jetstream.hasTeamFeatures"
                >
                  <template #trigger>
                    <span class="inline-flex rounded-md">
                      <button
                        type="button"
                        class="inline-flex items-center px-3 py-2 text-sm font-medium leading-4 text-gray-500 transition bg-white border border-transparent rounded-md hover:bg-gray-50 hover:text-gray-700 focus:outline-none focus:bg-gray-50 active:bg-gray-50"
                      >
                        {{ $page.props.user.current_team.name }}

                        <svg
                          class="ml-2 -mr-0.5 h-4 w-4"
                          xmlns="http://www.w3.org/2000/svg"
                          viewBox="0 0 20 20"
                          fill="currentColor"
                        >
                          <path
                            fill-rule="evenodd"
                            d="M10 3a1 1 0 01.707.293l3 3a1 1 0 01-1.414 1.414L10 5.414 7.707 7.707a1 1 0 01-1.414-1.414l3-3A1 1 0 0110 3zm-3.707 9.293a1 1 0 011.414 0L10 14.586l2.293-2.293a1 1 0 011.414 1.414l-3 3a1 1 0 01-1.414 0l-3-3a1 1 0 010-1.414z"
                            clip-rule="evenodd"
                          />
                        </svg>
                      </button>
                    </span>
                  </template>

                  <template #content>
                    <div class="w-60">
                      <!-- Team Management -->
                      <template v-if="$page.props.jetstream.hasTeamFeatures">
                        <div class="block px-4 py-2 text-xs text-gray-400">
                          Manage Team
                        </div>

                        <!-- Team Settings -->
                        <jet-dropdown-link
                          :href="
                            route('teams.show', $page.props.user.current_team)
                          "
                        >
                          Team Settings
                        </jet-dropdown-link>

                        <jet-dropdown-link
                          :href="route('teams.create')"
                          v-if="$page.props.jetstream.canCreateTeams"
                        >
                          Create New Team
                        </jet-dropdown-link>

                        <div class="border-t border-gray-100"></div>

                        <!-- Team Switcher -->
                        <div class="block px-4 py-2 text-xs text-gray-400">
                          Switch Teams
                        </div>

                        <template
                          v-for="team in $page.props.user.all_teams"
                          :key="team.id"
                        >
                          <form @submit.prevent="switchToTeam(team)">
                            <jet-dropdown-link as="button">
                              <div class="flex items-center">
                                <svg
                                  v-if="
                                    team.id == $page.props.user.current_team_id
                                  "
                                  class="w-5 h-5 mr-2 text-green-400"
                                  fill="none"
                                  stroke-linecap="round"
                                  stroke-linejoin="round"
                                  stroke-width="2"
                                  stroke="currentColor"
                                  viewBox="0 0 24 24"
                                >
                                  <path
                                    d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"
                                  ></path>
                                </svg>
                                <div>{{ team.name }}</div>
                              </div>
                            </jet-dropdown-link>
                          </form>
                        </template>
                      </template>
                    </div>
                  </template>
                </jet-dropdown>
              </div>

              <!-- Settings Dropdown -->
              <div class="relative ml-3">
                <jet-dropdown align="right" width="48">
                  <template #trigger>
                    <button
                      v-if="$page.props.jetstream.managesProfilePhotos"
                      class="flex text-sm transition border-2 border-transparent rounded-full focus:outline-none focus:border-gray-300"
                    >
                      <img
                        class="object-cover w-8 h-8 rounded-full"
                        :src="$page.props.user.profile_photo_url"
                        :alt="$page.props.user.name"
                      />
                    </button>

                    <span v-else class="inline-flex rounded-md">
                      <button
                        type="button"
                        class="inline-flex items-center px-3 py-2 text-sm font-medium leading-4 text-gray-500 transition bg-white border border-transparent rounded-md hover:text-gray-700 focus:outline-none"
                      >
                        {{ $page.props.user.name }}

                        <svg
                          class="ml-2 -mr-0.5 h-4 w-4"
                          xmlns="http://www.w3.org/2000/svg"
                          viewBox="0 0 20 20"
                          fill="currentColor"
                        >
                          <path
                            fill-rule="evenodd"
                            d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                            clip-rule="evenodd"
                          />
                        </svg>
                      </button>
                    </span>
                  </template>

                  <template #content>
                    <!-- Account Management -->
                    <div class="block px-4 py-2 text-xs text-gray-400">
                      Manage Account
                    </div>

                    <jet-dropdown-link :href="route('profile.show')">
                      Profile
                    </jet-dropdown-link>

                    <jet-dropdown-link
                      :href="route('api-tokens.index')"
                      v-if="$page.props.jetstream.hasApiFeatures"
                    >
                      API Tokens
                    </jet-dropdown-link>

                    <div class="border-t border-gray-100"></div>

                    <!-- Authentication -->
                    <form @submit.prevent="logout">
                      <jet-dropdown-link as="button">
                        Log Out
                      </jet-dropdown-link>
                    </form>
                  </template>
                </jet-dropdown>
              </div>
            </div>

            <!-- Hamburger -->
            <div class="flex items-center -mr-2 sm:hidden">
              <button
                @click="showingNavigationDropdown = !showingNavigationDropdown"
                class="inline-flex items-center justify-center p-2 text-gray-400 transition rounded-md hover:text-gray-500 hover:bg-gray-100 focus:outline-none focus:bg-gray-100 focus:text-gray-500"
              >
                <svg
                  class="w-6 h-6"
                  stroke="currentColor"
                  fill="none"
                  viewBox="0 0 24 24"
                >
                  <path
                    :class="{
                      hidden: showingNavigationDropdown,
                      'inline-flex': !showingNavigationDropdown,
                    }"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M4 6h16M4 12h16M4 18h16"
                  />
                  <path
                    :class="{
                      hidden: !showingNavigationDropdown,
                      'inline-flex': showingNavigationDropdown,
                    }"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M6 18L18 6M6 6l12 12"
                  />
                </svg>
              </button>
            </div>
          </div>
        </div>

        <!-- Responsive Navigation Menu -->
        <div
          :class="{
            block: showingNavigationDropdown,
            hidden: !showingNavigationDropdown,
          }"
          class="sm:hidden"
        >
          <div class="pt-2 pb-3 space-y-1">
            <jet-responsive-nav-link
              :href="route('dashboard')"
              :active="route().current('dashboard')"
            >
              Dashboard
            </jet-responsive-nav-link>
          </div>

          <!-- Responsive Settings Options -->
          <div class="pt-4 pb-1 border-t border-gray-200">
            <div class="flex items-center px-4">
              <div
                v-if="$page.props.jetstream.managesProfilePhotos"
                class="mr-3 shrink-0"
              >
                <img
                  class="object-cover w-10 h-10 rounded-full"
                  :src="$page.props.user.profile_photo_url"
                  :alt="$page.props.user.name"
                />
              </div>

              <div>
                <div class="text-base font-medium text-gray-800">
                  {{ $page.props.user.name }}
                </div>
                <div class="text-sm font-medium text-gray-500">
                  {{ $page.props.user.email }}
                </div>
              </div>
            </div>

            <div class="mt-3 space-y-1">
              <jet-responsive-nav-link
                :href="route('profile.show')"
                :active="route().current('profile.show')"
              >
                Profile
              </jet-responsive-nav-link>

              <jet-responsive-nav-link
                :href="route('api-tokens.index')"
                :active="route().current('api-tokens.index')"
                v-if="$page.props.jetstream.hasApiFeatures"
              >
                API Tokens
              </jet-responsive-nav-link>

              <!-- Authentication -->
              <form method="POST" @submit.prevent="logout">
                <jet-responsive-nav-link as="button">
                  Log Out
                </jet-responsive-nav-link>
              </form>

              <!-- Team Management -->
              <template v-if="$page.props.jetstream.hasTeamFeatures">
                <div class="border-t border-gray-200"></div>

                <div class="block px-4 py-2 text-xs text-gray-400">
                  Manage Team
                </div>

                <!-- Team Settings -->
                <jet-responsive-nav-link
                  :href="route('teams.show', $page.props.user.current_team)"
                  :active="route().current('teams.show')"
                >
                  Team Settings
                </jet-responsive-nav-link>

                <jet-responsive-nav-link
                  :href="route('teams.create')"
                  :active="route().current('teams.create')"
                  v-if="$page.props.jetstream.canCreateTeams"
                >
                  Create New Team
                </jet-responsive-nav-link>

                <div class="border-t border-gray-200"></div>

                <!-- Team Switcher -->
                <div class="block px-4 py-2 text-xs text-gray-400">
                  Switch Teams
                </div>

                <template
                  v-for="team in $page.props.user.all_teams"
                  :key="team.id"
                >
                  <form @submit.prevent="switchToTeam(team)">
                    <jet-responsive-nav-link as="button">
                      <div class="flex items-center">
                        <svg
                          v-if="team.id == $page.props.user.current_team_id"
                          class="w-5 h-5 mr-2 text-green-400"
                          fill="none"
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          stroke-width="2"
                          stroke="currentColor"
                          viewBox="0 0 24 24"
                        >
                          <path
                            d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"
                          ></path>
                        </svg>
                        <div>{{ team.name }}</div>
                      </div>
                    </jet-responsive-nav-link>
                  </form>
                </template>
              </template>
            </div>
          </div>
        </div>
      </nav>

      <!-- Page Heading -->
      <header class="bg-white shadow" v-if="$slots.header">
        <div class="px-4 py-6 mx-auto max-w-7xl sm:px-6 lg:px-8">
          <slot name="header"></slot>
        </div>
      </header>

      <!-- Page Content -->
      <main>
        <slot></slot>
      </main>
    </div>
  </div>
</template>

<script>
/* Main Functions */
import { defineComponent, ref } from "vue";
import { Head, Link } from "@inertiajs/vue3";
import { library } from "@fortawesome/fontawesome-svg-core";
import darkModeFn from "@/Function/darkMode";

/* Components */
import Logo from "@/Components/Icon/Logo.vue";

import JetBanner from "@/Jetstream/Banner.vue";
import JetApplicationMark from "@/Jetstream/ApplicationMark.vue";
import JetDropdown from "@/Jetstream/Dropdown.vue";
import JetDropdownLink from "@/Jetstream/DropdownLink.vue";
import JetNavLink from "@/Jetstream/NavLink.vue";
import JetResponsiveNavLink from "@/Jetstream/ResponsiveNavLink.vue";
import {
  faCog,
  faSearch,
  faLevelUpAlt,
  faTimes,
} from "@fortawesome/free-solid-svg-icons";

/* Inputs */
import InputText from "primevue/inputtext";

/* Multi-language */
import { useI18n } from "vue-i18n";
import langChooserFn from "@/Function/langChooser";
import { languages, flags, authTranslates } from "@/Lang/languages";

library.add(faCog, faSearch, faLevelUpAlt, faTimes);

export default defineComponent({
  props: {
    title: String,
  },

  components: {
    Head,
    Logo,
    InputText,
    JetBanner,
    JetApplicationMark,
    JetBanner,
    JetDropdown,
    JetDropdownLink,
    JetNavLink,
    JetResponsiveNavLink,
    Link,
  },

  setup() {
    /* Dark Mode */
    const { darkMode } = darkModeFn();

    /* Multi-language */
    const { changeLang, locale, loadingTranslations } = langChooserFn();

    const languageList = languages;

    const { t, tm } = useI18n({
      inheritLocale: true,
      messages: authTranslates,
    });

    const langSelector = ref();
    const showLanguagesPanel = (event) => {
      langSelector.value.toggle(event);
    };

    /* Search Bar */
    const searchText = ref("");
    const showSearchBar = ref(false);

    return {
      darkMode,
      /* Language */
      t,
      tm,
      languageList,
      showLanguagesPanel,
      changeLang,
      /* Search */
      searchText,
      showSearchBar,
    };
  },

  data() {
    return {
      showingNavigationDropdown: false,
    };
  },

  methods: {
    switchToTeam(team) {
      this.$inertia.put(
        route("current-team.update"),
        {
          team_id: team.id,
        },
        {
          preserveState: false,
        }
      );
    },

    logout() {
      this.$inertia.post(route("logout"));
    },
  },
});
</script>

<style scoped>
.darkTransition-enter-active,
.darkTransition-leave-active {
  transition: all 500ms ease-in-out;
}

.darkTransition-enter-from {
  opacity: 0;
  transform: translateX(0.5rem) scale(0) rotateZ(-360deg);
}

.darkTransition-leave-to {
  opacity: 0;
  transform: translateX(-0.5rem) scale(0) rotateZ(360deg);
}

.darkTransition-leave-from {
  opacity: 1;
  transform: translateX(0.5rem);
}

.darkTransition-enter-to {
  opacity: 1;
  transform: translateX(-0.5rem);
}
</style>
