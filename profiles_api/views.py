from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

from profiles_api import serializer


class HelloApiView(APIView):
    serializer_class = serializer.HelloSerializer

    def get(self, request, format=None):
        an_apiview = [
            'aaa',
            'bbb',
            'ccc',
        ]

        return Response({'message': 'Hello!', 'an_apiview': an_apiview})

    def post(self, request):
        serializer = self.serializer_class(data=request.data)

        if serializer.is_valid():
            return Response({
                'message': f'Hello {serializer.validated_data.get('name')}'
            })
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)