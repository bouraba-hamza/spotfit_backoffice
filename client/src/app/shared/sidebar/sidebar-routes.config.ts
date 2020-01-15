import { RouteInfo } from '@app/shared/sidebar/sidebar.metadata';

export const ROUTES: RouteInfo[] = [


    {
        path: '/dashboard/home', title: 'Spotfit', icon: 'ft-square', class: '', badge: '', badgeClass: '', isExternalLink: false, submenu: []
    },
    {
        path: '', title: 'Membres', icon: 'ft-home', class: 'has-sub', badge: '2', badgeClass: 'badge badge-pill badge-danger float-right mr-1 mt-1', isExternalLink: false, submenu: 
        [
            { path: '/dashboard/admins', title: 'Admins', icon: 'icon-users', class: '', badge: '', badgeClass: '', isExternalLink: false, submenu: []},
            { path: '/dashboard/partners', title: 'Partenaires', icon: 'icon-notebook', class: '', badge: '', badgeClass: '', isExternalLink: false, submenu: []},
            { path: '/dashboard/customers', title: 'Clients', icon: 'icon-star', class: '', badge: '', badgeClass: '', isExternalLink: false, submenu: []},
            { path: '/dashboard/trainers', title: 'Entraîneurs', icon: 'icon-flag', class: '', badge: '', badgeClass: '', isExternalLink: false, submenu: []},        
        ]
    },

    {
        path: '', title: 'Gym', icon: 'ft-home', class: 'has-sub', badge: '2', badgeClass: 'badge badge-pill badge-danger float-right mr-1 mt-1', isExternalLink: false, submenu: 
        [
            { path: '/dashboard/gym', title: 'Gyms', icon: 'ft-layout', class: '', badge: '', badgeClass: '', isExternalLink: false, submenu: []},
            { path: '/dashboard/equipement', title: 'Equipements', icon: 'ft-layout', class: '', badge: '', badgeClass: '', isExternalLink: false, submenu: []},
            {path: '/dashboard/group', title: 'Groups', icon: 'ft-layout', class: '', badge: '', badgeClass: '', isExternalLink: false, submenu: []},
          //  { path: '/dashboard/pass', title: 'Passes', icon: 'ft-layout', class: '', badge: '', badgeClass: '', isExternalLink: false, submenu: []},
            { path: '/dashboard/classe', title: 'Passes', icon: 'ft-layout', class: '', badge: '', badgeClass: '', isExternalLink: false, submenu: []},        
            { path: '/dashboard/activitie', title: 'Activities', icon: 'ft-layout', class: '', badge: '', badgeClass: '', isExternalLink: false, submenu: []},        
            { path: '/dashboard/facilitie', title: 'Facilities', icon: 'ft-layout', class: '', badge: '', badgeClass: '', isExternalLink: false, submenu: []},        
        ]
    },
    {
        path: '/dashboard/chat', title: 'Calendrier', icon: 'ft-calendar', class: '', badge: '', badgeClass: '', isExternalLink: false, submenu: []
    },
    {
        path: '/dashboard/chat', title: 'Chat', icon: 'ft-message-square', class: '', badge: '', badgeClass: '', isExternalLink: false, submenu: []
    },
    {
        path: '/dashboard/adminscan', title: 'Admin SCAN', icon: 'ft-layout', class: '', badge: '', badgeClass: '', isExternalLink: false, submenu: []
    },
    {
        path: '/dashboard/robot', title: 'Settings / AI', icon: 'ft-layout', class: '', badge: '', badgeClass: '', isExternalLink: false, submenu: []
    },
    {
        path: '/dashboard/documentation', title: 'Documentation', icon: 'ft-book', class: '', badge: '', badgeClass: '', isExternalLink: false, submenu: []
    },
    {
        path: '/dashboard/settings', title: 'Settings', icon: 'ft-settings', class: '', badge: '', badgeClass: '', isExternalLink: false, submenu: []
    },
    {
        path: '/dashboard/support', title: 'Support', icon: 'ft-life-buoy', class: '', badge: '', badgeClass: '', isExternalLink: false, submenu: []
    },
];
