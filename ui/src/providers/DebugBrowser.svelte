<script>
	import { PLAYER } from '@store/player'
    import { debugData } from '../utils/debugData';

	let show = true;
    //EXAMPLE

	let debugLOCALE = {
		ui: { 
			mdt: "Mobile Data Terminal",
			navigation: {
				dashboard: "Dashboard",
				profiles: "Profiles",
				incidents: "Incidents",
				reports: "Reports",
				dispatch: "Dispatch",
				businesses: "Businesses",
				weapons: "Weapons",
				cameras: "Cameras",
				evidence : "Evidence",
				vehicles: "Vehicles",
				roster: "Roster",
				charges: "Charges",
				logs: "Logs",
				settings: "Settings"
			},
			shared: {
				search: "Search"
			},
			announcements: {
				title: "Announcements",
				contextmenu: {
					new: "New Announcement",
					edit: "Edit Announcement",
					delete: "Delete Announcement"
				},
				modal: {
					title: "Title",
					description: "Description",
					cancel: "Cancel",
					create: "Create",
					save: "Save"
				}
			},
			chat: {
				title: "Chat",
				placeholder: "Type a message"
			},
			active_officers: {
				contextmenu: {
					toggleduty: "Toggle Duty",
					setcallsign: "Set Callsign",
					setradio: "Set Radio"
				}
			},
			active_units: {

			},
			profiles: {
				manage_profile: "Manage Profile",
				fullname: "Fullname",
				birthdatte: "Birthdate",
				gender: "Gender",
				phonenumber: "Phone Number",
				job: "Job",
				tags: "Tags",
				gallery: "Gallery",
				licenses: "Licences",
				properties: "Properties"
			},
			incidents: {
				manage_incident: "Manage Incident",
				officers_involved: "Officers Involved",
				civilians_involved: "Civilian Involved",
				criminals_involved: "Criminals Involved",
				no_information: "No Information."
			
			},
			reports: {

			},
			dispatch: {
				contextmenu: {
					waypoint: "Set Waypoint",
					attach: "Attach",
					detach: "Detach"
				}
			},
			weapons: {

			},
			evidence: {

			},
			vehicles: {
				manage_vehicle: "Manage Vehicle",
				label: "Label",
				plate: "Plate",
				model: "Model"
			},
			roster: {

			},
			logs: {

			},
			settings: {

			}
		},
		open_mdt: "Open Mobile Data Terminal",
		no_valid_job: "You don't have a valid job for this!"
	}

	
	let debugPLAYER = {
		source: 4,
		citizenid: "FA42424",
		job: {
			isboss: true,
			payment: 2000,
			grade: {
				level: 4,
				name: "Police Officer",
			},
			type: "leo",
			onduty: true,
			label: "POLITI",
			name: "police",
		},
		charinfo: {
			lastname: "string",
			firstname: "string",
			gender: 1,
			birthdate: "string",
			phone: "string",
			cid: "FA42424",
		},
		metadata: {
			callsign: "A-32",
		},
	}

	let debugACTIVEUNITS = [
		{
			name: "Herman Jonsen",
			job: "police",
			jobtype: "leo",
			callsign: "A-32",
			grade: "Cheif",
			onduty: true,
		},
		{
			name: "Per Hermansen",
			job: "police",
			jobtype: "leo",
			callsign: "L-25",
			grade: "SERGEANT",
			onduty: true,
		},
		{
			name: "OK1ez Jonsen",
			job: "ambulance",
			jobtype: "ems",
			callsign: "O-12",
			grade: "AMBULANCE",
			onduty: true,
		},
		{
			name: "Emily Anderson",
			job: "ambulance",
			jobtype: "ems",
			callsign: "P-10",
			grade: "AMBULANCE",
			onduty: false,
		},
		{
			name: "Herman Jonsen",
			job: "police",
			jobtype: "leo",
			callsign: "A-32",
			grade: "Cheif",
			onduty: true,
		},
		{
			name: "Per Hermansen",
			job: "police",
			jobtype: "leo",
			callsign: "L-25",
			grade: "SERGEANT",
			onduty: true,
		},
		{
			name: "OK1ez Jonsen",
			job: "ambulance",
			jobtype: "ems",
			callsign: "O-12",
			grade: "AMBULANCE",
			onduty: true,
		},
		{
			name: "Emily Anderson",
			job: "ambulance",
			jobtype: "ems",
			callsign: "P-10",
			grade: "AMBULANCE",
			onduty: false,
		},
		{
			name: "Herman Jonsen",
			job: "police",
			jobtype: "leo",
			callsign: "A-32",
			grade: "Cheif",
			onduty: true,
		},
		{
			name: "Per Hermansen",
			job: "police",
			jobtype: "leo",
			callsign: "L-25",
			grade: "SERGEANT",
			onduty: true,
		},
		{
			name: "OK1ez Jonsen",
			job: "ambulance",
			jobtype: "ems",
			callsign: "O-12",
			grade: "AMBULANCE",
			onduty: true,
		},
		{
			name: "Emily Anderson",
			job: "ambulance",
			jobtype: "ems",
			callsign: "P-10",
			grade: "AMBULANCE",
			onduty: false,
		},
		{
			name: "Herman Jonsen",
			job: "police",
			jobtype: "leo",
			callsign: "A-32",
			grade: "Cheif",
			onduty: true,
		},
		{
			name: "Per Hermansen",
			job: "police",
			jobtype: "leo",
			callsign: "L-25",
			grade: "SERGEANT",
			onduty: true,
		},
		{
			name: "OK1ez Jonsen",
			job: "ambulance",
			jobtype: "ems",
			callsign: "O-12",
			grade: "AMBULANCE",
			onduty: true,
		},
		{
			name: "Emily Anderson",
			job: "ambulance",
			jobtype: "ems",
			callsign: "P-10",
			grade: "AMBULANCE",
			onduty: false,
		},
	];

	let debugDISPATCHS = [
		{
			priority: 2,
			units: [
				{ name: "Herman Jonsen", callsign: "A-32", job: "police" },
				{ name: "Per Hermansen", callsign: "L-25", job: "police" },
			],
			time: "168621424242",
			dispatchcodename: "fight",
			dispatchMessage: "Fight In Progress",
			source: 1,
			origin: "",
			gender: "Male",
			dispatchCode: "10-05",
			jobtype: "leo",
			firstStreet: "East Los Santos",
			responses: ["Jon", "Knut"],
			callId: "69",
		},
		{
			priority: 2,
			units: [
				{ name: "Herman Jonsen", callsign: "A-32", job: "police" },
				{ name: "Per Hermansen", callsign: "L-25", job: "police" },
			],
			time: "168921424242",
			dispatchcodename: "driving",
			dispatchMessage: "Reckless driving",
			source: 1,
			origin: {
				x: 341.34,
				y: 152.54,
				z: 102.72
			},
			gender: "Male",
			dispatchCode: "10-17",
			jobtype: "leo",
			firstStreet: "East Los Santos",
			responses: ["Jon", "Knut"],
			automaticGunFire: false, 
			firstColor: "Cyan",
			plate: "DP 23021",
			heading: "South",
			model: "T20",
			callId: "420",
		}
	]

	let debugCAMERAS = [
		{
			id: "1",
			label: "Camera 1",
			type: "store",
			location: "Groove Street 52a",
			coords: { x: 0, y: 0, z: 0, },
			img: "https://i.imgur.com/Pfa57ud.png",
		},
		{
			id: "2",
			label: "Camera 2",
			type: "store",
			location: "Groove Street 12a",
			coords: { x: 0, y: 0, z: 0, },
			img: "https://i.imgur.com/Pfa57ud.png",
		},
		{
			id: "3",
			label: "Camera 3",
			type: "jewlery",
			location: "Groove Street 32a",
			coords: { x: 0, y: 0, z: 0, },
			img: "https://i.imgur.com/Pfa57ud.png",
		},
		{
			id: "4",
			label: "Camera 4",
			type: "bank",
			location: "Groove Street 44a",
			coords: { x: 0, y: 0, z: 0, },
			img: "https://i.imgur.com/Pfa57ud.png",
		},
		{
			id: "5",
			label: "Camera 5",
			type: "bank",
			location: "Groove Street 232b",
			coords: { x: 0, y: 0, z: 0, },
			img: "https://i.imgur.com/Pfa57ud.png",
		},
		{
			id: "6",
			label: "Camera 6",
			type: "bank",
			location: "Groove Street 232b",
			coords: { x: 0, y: 0, z: 0, },
			img: "https://i.imgur.com/Pfa57ud.png",
		},
		{
			id: "7",
			label: "Camera 7",
			type: "bank",
			location: "Groove Street 232b",
			coords: { x: 0, y: 0, z: 0, },
			img: "https://i.imgur.com/Pfa57ud.png",
		},
		{
			id: "8",
			label: "Camera 8",
			type: "bank",
			location: "Groove Street 232b",
			coords: { x: 0, y: 0, z: 0, },
			img: "https://i.imgur.com/Pfa57ud.png",
		},
		{
			id: "9",
			label: "Camera 9",
			type: "bank",
			location: "Groove Street 232b",
			coords: { x: 0, y: 0, z: 0, },
			img: "https://i.imgur.com/Pfa57ud.png",
		},
		{
			id: "10",
			label: "Camera 10",
			type: "bank",
			location: "Groove Street 232b",
			coords: { x: 0, y: 0, z: 0, },
			img: "https://i.imgur.com/Pfa57ud.png",
		},
		{
			id: "3",
			label: "Camera 3",
			type: "jewlery",
			location: "Groove Street 32a",
			coords: { x: 0, y: 0, z: 0, },
			img: "https://i.imgur.com/Pfa57ud.png",
		},
		{
			id: "4",
			label: "Camera 4",
			type: "bank",
			location: "Groove Street 44a",
			coords: { x: 0, y: 0, z: 0, },
			img: "https://i.imgur.com/Pfa57ud.png",
		},
		{
			id: "5",
			label: "Camera 5",
			type: "bank",
			location: "Groove Street 232b",
			coords: { x: 0, y: 0, z: 0, },
			img: "https://i.imgur.com/Pfa57ud.png",
		},
		{
			id: "6",
			label: "Camera 6",
			type: "bank",
			location: "Groove Street 232b",
			coords: { x: 0, y: 0, z: 0, },
			img: "https://i.imgur.com/Pfa57ud.png",
		},
		{
			id: "7",
			label: "Camera 7",
			type: "bank",
			location: "Groove Street 232b",
			coords: { x: 0, y: 0, z: 0, },
			img: "https://i.imgur.com/Pfa57ud.png",
		},
		{
			id: "8",
			label: "Camera 8",
			type: "bank",
			location: "Groove Street 232b",
			coords: { x: 0, y: 0, z: 0, },
			img: "https://i.imgur.com/Pfa57ud.png",
		},
		{
			id: "9",
			label: "Camera 9",
			type: "bank",
			location: "Groove Street 232b",
			coords: { x: 0, y: 0, z: 0, },
			img: "https://i.imgur.com/Pfa57ud.png",
		},
		{
			id: "10",
			label: "Camera 10",
			type: "bank",
			location: "Groove Street 232b",
			coords: { x: 0, y: 0, z: 0, },
			img: "https://i.imgur.com/Pfa57ud.png",
		},
		{
			id: "11",
			label: "Camera 11",
			type: "bank",
			location: "Groove Street 232b",
			coords: { x: 0, y: 0, z: 0, },
			img: "https://i.imgur.com/Pfa57ud.png",
		}
	]

	const debugPROFILES = [
		{
			cid: "GDEG892",
			fullname: "Sarah Johnson",
			lastedited: "Johnson",
			dob: "15/09/1995",
			gender: "Female",
			job: "Police",
			apartment: "Del Perro Heights",
			details: "Repellendus dolor at. Ducimus illo ex commodi pariatur expedita nihil non molestias non. Ab voluptatem ducimus laboriosam voluptas beatae dolores repellat consequatur dicta.",
			fingerprint: "7462839401",
			pfp: "https://i.imgur.com/N09S9P7.jpg",
			licences: {
				driver: true,
				hunting: false,
				truck: false,
				weapon: true,
				theory: false
			},
			tags: ["SUSPECTED", "PUBLIC SAFETY", "BOMB THREAT"],
			vehicles: ["Sultan RS", "Audi R6"],
			properties: [],
			gallery: ["https://i.imgur.com/jjnRXKm.jpeg"],
		},
		{
			cid: "GDPG123",
			fullname: "Michael Thompson",
			lastedited: "Thomson",
			dob: "10/12/1988",
			gender: "Male",
			job: "Los Santos Police Department",
			apartment: "Hawick Ave",
			details: "Repellendus dolor at. Ducimus illo ex commodi pariatur expedita nihil non molestias non. Ab voluptatem ducimus laboriosam voluptas beatae dolores repellat consequatur dicta.",
			fingerprint: "1234567890",
			pfp: "https://i.imgur.com/N09S9P7.jpg",
			licences: {
				driver: true,
				hunting: false,
				truck: false,
				weapon: true,
				theory: false
			},
			tags: ["SUSPECTED", "PUBLIC SAFETY", "BOMB THREAT"],
			vehicles: ["Sultan RS", "Audi R6"],
			properties: ["Hawick Ave", "Tinsel Heights"],
			gallery: ["https://i.imgur.com/jjnRXKm.jpeg"],
		},
		{
			cid: "GDKL567",
			fullname: "Emily Roberts",
			lastedited: "Roberts",
			dob: "05/03/1992",
			gender: "Female",
			job: "Weazel News",
			apartment: "Tinsel Towers",
			details: "Repellendus dolor at. Ducimus illo ex commodi pariatur expedita nihil non molestias non. Ab voluptatem ducimus laboriosam voluptas beatae dolores repellat consequatur dicta.",
			fingerprint: "9876543210",
			pfp: "https://i.imgur.com/N09S9P7.jpg",
			licences: {
				driver: true,
				hunting: false,
				truck: false,
				weapon: true,
				theory: false
			},
			tags: ["SUSPECTED", "PUBLIC SAFETY", "BOMB THREAT"],
			vehicles: ["Sultan RS", "Audi R6"],
			properties: ["Hawick Ave 1", "Tinsel Heights 55"],
			gallery: ["https://i.imgur.com/jjnRXKm.jpeg"],
		},
	]

	let debugANNOUNCEMENTS = [
		{
			id: "1",
			title: "Lorem ipsum",
			description: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, voluptatum.",
			time: "168921424242",
			author: "Herman Jonsen",
			job: "police",
			jobtype: "leo",
		},
		{
			id: "2",
			title: "Police sit amet",
			description: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, voluptatum.",
			time: "168921424242",
			author: "Per kjell",
			job: "police",
			jobtype: "leo",
		},
		{
			id: "3",
			title: "Ambulanse sit amet",
			description: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, voluptatum.",
			time: "168921424242",
			author: "Petter Jonsen",
			job: "ambulance",
			jobtype: "ems",
		},
		{
			id: "4",
			title: "sit amet",
			description: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, voluptatum.",
			time: "168921424242",
			author: "Herman Jonsen",
			job: "lawyer",
			jobtype: "doj",
		},
		{
			id: "5",
			title: "Lawyer sit amet",
			description: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, voluptatum.",
			time: "168921424242",
			author: "Herman Jonsen",
			job: "lawyer",
			jobtype: "doj",
		},
	];

	let debugINCIDENTS = [
		{
			id: "1",
			author: "Liam Parker",
			title: "Medical Emergency at Sports Stadium",
			details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
			tags: ["EMERGENCY", "MEDICAL", "STADIUM"],
			officersinvolved: ["Officer White", "Officer Martin"],
			civsinvolved: ["Brown", "Martinez"],
			criminalsinvolved: [
				{
					name: "Herman Jonsen",
					charges: [
						{
							id: 1,
							name: "Robbery",
							description: "Misdemeanor",
							fine: 1000,
							jailtime: 0,
						},
						{
							id: 2,
							name: "Robbery",
							description: "Misdemeanor",
							fine: 1000,
							jailtime: 5,
						},
					]
				}
			],
			evidence: ["https://cdn.discordapp.com/attachments/1051940473394176070/1115351165987725383/image.png", "https://cdn.discordapp.com/attachments/1051940473394176070/1115351721091285192/image.png", "https://cdn.discordapp.com/attachments/1051940473394176070/1115353658234769418/image.png", "https://cdn.discordapp.com/attachments/1051940473394176070/1115353896190226473/image.png"],
			time: "18.30",
			jobtype: "ems"
		},
		{
			id: "2",
			author: "John Anderson",
			title: "Suspicious Activity at Park",
			details: "Store robbery near pacific bank, 3 suspects armed with class 2",
			tags: [],
			officersinvolved: ["Officer Thompson", "Officer Davis"],
			civsinvolved: ["Brown", "Martinez"],
			criminalsinvolved: [
				{
					name: "Herman Jonsen",
					charges: [
						{
							id: 1,
							name: "Robbery",
							description: "Misdemeanor",
							fine: 1000,
							jailtime: 0,
						},
						{
							id: 2,
							name: "Robbery",
							description: "Misdemeanor",
							fine: 1000,
							jailtime: 5,
						},
					]
				}
			],
			evidence: [],
			time: "18.30",
			jobtype: "leo"
		},
		{
			id: "3",
			author: "Emily Roberts",
			title: "Fire at Residential Building",
			details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
			tags: ["EMERGENCY", "FIRE INCIDENT", "RESIDENTIAL AREA"],
			officersinvolved: ["Officer Brown", "Officer Martinez"],
			civsinvolved: ["Brown", "Martinez"],
			criminalsinvolved: [
				{
					name: "Herman Jonsen",
					charges: [
						{
							id: 1,
							name: "Robbery",
							description: "Misdemeanor",
							fine: 1000,
							jailtime: 0,
						},
						{
							id: 2,
							name: "Robbery",
							description: "Misdemeanor",
							fine: 1000,
							jailtime: 5,
						},
					]
				}
			],
			evidence: [],
			time: "18.30",
			jobtype: "ems"
		},
	]

	let debugPERMISSIONS = [
		{
			leo: {
				create_incident: 1,
				delete_incident: 1,
				create_report: 1,
				delete_report: 1,
				create_announcement: 1,
				delete_announcement: 1,
				create_warrant: 1,
				delete_warrant: 1,
				create_bolo: 1,
				delete_bolo: 1,
				hire: 1,
				fire: 1,
				logs: 1,
			},
			ems: {
				create_incident: 1,
				delete_incident: 1,
				create_report: 1,
				delete_report: 1,
				create_announcement: 1,
				delete_announcement: 1,
				create_warrant: 1,
				delete_warrant: 1,
				create_bolo: 1,
				delete_bolo: 1,
				hire: 1,
				fire: 1,
				logs: 1,
			},
			doj: {
				create_incident: 1,
				delete_incident: 1,
				create_report: 1,
				delete_report: 1,
				create_announcement: 1,
				delete_announcement: 1,
				create_warrant: 1,
				delete_warrant: 1,
				create_bolo: 1,
				delete_bolo: 1,
				hire: 1,
				fire: 1,
				logs: 1,
			},
		},
	];

	let options = [
		{
			component: 'Show',
			actions : [
				{
					name: "show",
					action: "setVisible",
					data: true,
				},
				{
					name: "hide",
					action: "setVisible",
					data: false,
				},
			]
		},
		{
			component: 'Mdt Type',
			actions : [
				{
					name: "Police",
					custom: true,
					customFunction: () => {
						PLAYER.set(
							{
								source: 4,
								citizenid: "FA42424",
								job: {
									isboss: true,
									payment: 2000,
									grade: {
										level: 4,
										name: "Police Officer",
									},
									type: "leo",
									onduty: true,
									label: "POLITI",
									name: "police",
								},
								charinfo: {
									lastname: "Jonsen",
									firstname: "Liam",
									gender: 1,
									birthdate: "12/20/6900",
									phone: "94242453",
									cid: "FA42424",
								},
								metadata: {
									callsign: "A-32",
								},
							}
						);
					}
				},
				{
					name: "Ambulance",
					custom: true,
					customFunction: () => {
						PLAYER.set(
							{
								source: 3,
								citizenid: "FA42424",
								job: {
									isboss: true,
									payment: 1500,
									grade: {
										level: 4,
										name: "Doctor",
									},
									type: "ems",
									onduty: true,
									label: "Ambulansen",
									name: "ambulance",
								},
								charinfo: {
									lastname: "Berg",
									firstname: "Per",
									gender: 1,
									birthdate: "20/20/4200",
									phone: "94242453",
									cid: "FA42424",
								},
								metadata: {
									callsign: "A-22",
								},
							}
						);
					}
				},
				{
					name: "Lawyer",
					custom: true,
					customFunction: () => {
						PLAYER.set(
							{
								source: 3,
								citizenid: "FA42424",
								job: {
									isboss: true,
									payment: 1500,
									grade: {
										level: 4,
										name: "Advokat",
									},
									type: "doj",
									onduty: true,
									label: "Oslo Tingrett",
									name: "lawyer",
								},
								charinfo: {
									lastname: "Vik",
									firstname: "Rune",
									gender: 1,
									birthdate: "20/20/4200",
									phone: "94242453",
									cid: "FA42424",
								},
								metadata: {
									callsign: "LAWYER NO CALLSIGN",
								},
							}
						);
					}
				},
			]
		},
	]

	debugData([
		{
		action: "setPlayersData",
		data: debugPLAYER
		},
	])

	debugData([
		{
		action: "setLocaleData",
		data: debugLOCALE
		},
	])

	debugData([
		{
		action: "setCameraData",
		data: debugCAMERAS
		},
	])

	debugData([
		{
		action: "setProfileData",
		data: debugPROFILES
		},
	])

	debugData([
		{
		action: "setActiveUnitsData",
		data: debugACTIVEUNITS
		},
	])

	debugData([
		{
		action: "setDispatchsData",
		data: debugDISPATCHS
		},
	])

	debugData([
		{
		action: "setAnnouncementsData",
		data: debugANNOUNCEMENTS
		},
	])

	debugData([
		{
		action: "setIncidentsData",
		data: debugINCIDENTS
		},
	])

	debugData([
		{
		action: "setPermissionsData",
		data: debugPERMISSIONS
		},
	])

</script>

<div class="w-screen h-screen flex justify-center">
	<div class="absolute top-0  z-[1000] font-medium uppercase p-[0.5vh] flex flex-col">
		<button class="bg-neutral-800 hover:bg-opacity-90 w-[15vh] py-2 flex items-center justify-center"
			on:click={() => {
				show = !show;
			}}
		>
			<p>DEBUG</p>
		</button>
		{#if show}
		<div class="w-full h-fit bg-neutral-700">
			{#each options as option}
			<div class="flex flex-col gap-1 p-3">
				<p class="h-full w-full mr-2">{option.component}</p>
				{#each option.actions as action}
				<button class="bg-neutral-600 p-2"
					on:click={() => {

						if (action.custom == true) {
							action.customFunction();
							return
						}
						debugData([
							{
								action: action.action,
								data: action.data,
							},
						])
					}}
				>
				{action.name}
				</button>
				{/each}
			</div>
			{/each}
		</div>
		{/if}
	</div>
</div>