from django.test import TestCase
from django.urls import reverse
from django.contrib.auth.models import User
from .models import Profile

class TestDjangoAppViews(TestCase):
    def setUp(self):
        # Create a user for testing
        self.user = User.objects.create_user(
            username='Leah',
            password='1212',
            email='miri@google.com'
        )
        self.client.login(username='Leah', password='1212')

    def test_home_view(self):
        response = self.client.get(reverse('home'))
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'blog/home.html')

    def test_about_view(self):
        response = self.client.get(reverse('about'))
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'blog/about.html')

    def test_register_view(self):
        response = self.client.get(reverse('register'))
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'users/register.html')

        response = self.client.post(reverse('register'), {
            'username': 'Leah',
            'email': 'miri@google.com',
            'password1': '1212',
            'password2': '1212'
        })
        self.assertEqual(response.status_code, 302)  # Successful redirect

        new_user = User.objects.get(username='newuser')
        self.assertIsNotNone(new_user)

    def test_profile_view(self):
        response = self.client.get(reverse('profile'))
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'users/profile.html')

        response = self.client.post(reverse('profile'), {
            'username': 'Leah',
            'email': 'miri@google.com'
            # Include other fields as needed
        })
        self.assertEqual(response.status_code, 302)  # Successful redirect

        updated_user = User.objects.get(username='Leah')
        self.assertEqual(updated_user.email, 'miri@google.com')

    # Add more tests for other views as needed
