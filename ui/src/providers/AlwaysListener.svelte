<script lang="ts">
	import { ANNOUNCEMENTS } from '@store/announcements'
	import { CAMERAS } from '@store/cameras'
	import { DISPATCHS } from '@store/dispatchs'
	import { INCIDENTS } from '@store/incidents'
	import { LOCALE } from '@store/locales'
	import { OFFICERS } from '@store/officers'
	import { PLAYER } from '@store/player'
	import { PROFILES } from '@store/profiles'
	import { PERMISSIONS } from '@store/permissions'
	import { ReceiveNUI } from '@utils/ReceiveNUI'
	import { debugData } from '@utils/debugData'
	import { MESSAGES } from '@store/messages'
	
	debugData([
		{
			action: 'setVisible',
			data: true,
		},
	])

	debugData([
		{
			action: 'setBrowserMode',
			data: true
		},
	])

	ReceiveNUI('initalize', (data: any) => {
		$PLAYER = data.player
		$LOCALE = data.locales
		$PERMISSIONS = data.permissions
		$CAMERAS = data.cameras
	})

	ReceiveNUI('setPlayersData', (data: any) => {
		$PLAYER = data
	})

	ReceiveNUI('setLocaleData', (data: any) => {
		$LOCALE = data
	})

	ReceiveNUI('setCameraData', (data: any) => {
		$CAMERAS = data
	})

	ReceiveNUI('setProfileData', (data: any) => {
		$PROFILES = data
	})

	ReceiveNUI('setActiveOfficersData', (data: any) => {
		$PROFILES = data
	})

	ReceiveNUI('setActiveUnitsData', (data: any) => {
		$OFFICERS = data
	})

	ReceiveNUI('setDispatchsData', (data: any) => {
		$DISPATCHS = data
	})

	ReceiveNUI('setAnnouncementsData', (data: any) => {
		$ANNOUNCEMENTS = data
	})

	ReceiveNUI('setIncidentsData', (data: any) => {
		$INCIDENTS = data
	})

	ReceiveNUI('setPermissionsData', (data: any) => {
		$PERMISSIONS = data
	})

	ReceiveNUI('newMessage', (data: any) => {
		$MESSAGES = data;
	})

</script>
